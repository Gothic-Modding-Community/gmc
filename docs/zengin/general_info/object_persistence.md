# Object persistence

In order to simplify the process of loading and saving data of various types to and from the user's hard-drive, ZenGin implements a simple object persistence system using the `zCArchiver` class and its derivatives that allow the individual engine classes to implement a routine specifying which data should be saved or loaded from disk and in which manner.

An object that is derived from the `zCObject` class may overload the `Archive` and `Unarchive` virtual methods. The class may then call on an interface provided by the `zCArchiver` class within these methods which allows it to directly read from or write to a stream using several modes. Those are ASCII and BinSafe by default. There are, however, more options, as is explained below.

## Archive format

In order to better understand how this process works, it would be best to look at an example of a .ZEN file containing an instance of an `oCWorld` object.

### Header

When you open up a ZenGin archive, you will see the following at the start of the file:

```
ZenGin Archive
ver 1
zCArchiverGeneric
ASCII
saveGame 0
date 7.1.2001 23:9:19
user roeske
END
objects 2594     
END
```

Let's look at each of these properties and what they mean:

`ZenGin Archive`

This simply specifies that the following data is an `zCArchiver` archive.

`ver 1`

Version specification. Can be either `0` or `1`. Both Gothic 1 and 2 are already on version 1, although version 0 archives can also be occasionally found.

`zCArchiverGeneric`

Specifies which derived `zCArchiver` class should be used to read this archive. Accepted values are `zCArchiverGeneric` for ASCII and Binary archives, and `zCArchiverBinSafe` for BinSafe archives. More info below.  
This property might not be present in older archives.

`ASCII`

This is the most important part of the header as it specifies in which format should the data be stored. There are 4 different modes:

- **ASCII** - The simplest one. It stores data in human-readable ASCII notation (not unlike JSON for example). This is usually used when saving data during development and/or testing, while the final version of said data will most likely be stored as BIN_SAFE.
- **ASCII_PROPS** - Same as ASCII except with more additional data that the developer can specify for visual clarity. In practice, it is not used anywhere and mostly serves only to prettify debug info (try typing `ZWORLD VOBPROPS` in the console and look in [zSpy](../tools/zSpy.md) ;) ).
- **BINARY** - Binary representation of the class instance, which mostly copies the data 1:1 into/from the stream. In practice, this format is only used to store savefiles (.SAV).
- **BIN_SAFE** - BinSafe, short for Binary Safe, is an extended version of Binary which stores type information along with the data itself. This is meant to make error checking for invalid data easier. There are other changes which are explained below. Most, if not all world files (.ZEN), are stored in this format.

`saveGame 0`

Specifies if this archive is a savefile. This property might not be present in older archives.

`date 7.1.2001 23:9:19`

The date at which this archive was created.

`user roeske`

The user which created the archive. This property might not be present in older archives.

`END`

Tells the parses that this is the end of the header.

We may additionally find a property called `csum` in version 0 archives which stores the checksum of the whole archive. This property is, however, unused and equals `00000000` by default.

In order to correctly read the archive's header across varying engine versions, one should not count on the properties always being in the same order or even being there at all.

If the archive utilizes `zCArchiverGeneric` then this header will also be followed by a short section specifying the number of object instances in this archive. This value will be used to initialize the objectList, which is an array of pointers where the addresses of loaded objects will be stored for later referencing. This property would be directly part of the main header in older versions.

```  
objects 2594 END  
```  

If the archive is created using `zCArchiverBinSafe`, this data will be stored in the following binary structure:

```cpp  
struct BinSafeArchiveHeader  
{  
    uint32_t version;     // Always equals 2 uint32_t objectCount;  // Serves the same function as "objects n" uint32_t chunkPos;    // Offset to chunk hash table};
};  
```  

### Contents

Looking further into the archive, we see what appears to be a nested structure.

```

[% oCWorld:zCWorld 64513 0]
    [VobTree % 0 0]
        childs0=int:1
        [% zCVobLevelCompo:zCVob 12289 1]
            pack=int:0
            presetName=string:
            bbox3DWS=rawFloat:-71919.9609 -13091.8232 -59900 108999.992 20014.0352 67399.9922 
            trafoOSToWSRot=raw:0000803f0000000000000000000000000000803f0000000000000000000000000000803f
            trafoOSToWSPos=vec3:0 0 0
            vobName=string:LEVEL-VOB
            visual=string:SURFACE.3DS
            showVisual=bool:0
            visualCamAlign=enum:0
            cdStatic=bool:1
            cdDyn=bool:0
            staticVob=bool:0
            dynShadow=enum:0
            [visual zCMesh 0 2]
            []
            [ai % 0 0]
            []
        []
        ...
```

We primarily differentiate between chunks and properties within ZenGin archives:  
  
#### Chunks  
  
A chunk is a structure that groups properties together. For most of the time, a chunk represents a class instance. This is, however, not always true as classes may arbitrarily create chunks as is needed. For example, the sample above contains a chunk called `VobTree`, which does not represent a class instance, but only serves to make the reading of the archive easier.  
  
While in ASCII mode, the start of a chunk is represented using square brackets.  
  
`[% oCWorld:zCWorld 64513 0]`  
  
There are 4 pieces of data separated by spaces inside the start of each chunk, which are:  
  
- **Object name** - The name of the chunk to use while reading. If the chunk has no name, then it will be simply equal to `%`.  
- **Class name** - The name of the class which this chunk represents. Class names are stored with their full inheritance hierarchy (e.g. `oCMobLadder:oCMobInter:oCMOB:zCVob`). In case the chunk is not an object, but an arbitrary chunk, then this field will be equal to `%` (`%` can also mean that this chunk is a nullptr). In some cases you may encounter the symbol `§` instead. This means that the object already exists and that the parser should look for it in the objectList using the object index. Using this mechanism, a single instance can be referenced multiple times without worrying about duplicity.  
- **Class version** - Used to ensure that the data being read is compatible with the current game/engine version, so that there are no mismatches in the data pattern. This value is different for every class and varies between game versions.  
- **Object index** - An index into the objectList under which this object will be stored. If the class name is equal to `§`, then this value will be used to retrieve an existing instance from the objectList.  
  
If this is a Binary archive, the same data will be stored in the following binary structure:  

```cpp
struct BinaryObjectHeader
{
    uint32_t    objectSize;        // Size of the whole object in bytes
    uint16_t    classVersion;
    uint32_t    objectIndex;
    char        objectName[];    // Null-terminated string
    char        className[];    // Null-terminated string
};
```

Oddly enough, if the archive is BinSafe, then the data will be encoded the same way as in ASCII mode, except that it will be stored as a type-checked property.

```cpp
struct BinSafeObjectHeader
{
    uint32_t    type;    // 0x1 = TYPE_STRING
    uint16_t    length;    // Length of the text
    char        text[];    // [% oCWorld:zCWorld 64513 0]
};
```

In ASCII mode `[]` represents the end of the current chunk.

#### Properties

We find properties inside the chunks which are key-value pairs that classes use to store the actual data. Each property stores its name, type and value. In ASCII mode the format for this is`name=type:value`.

For example:

`visual=string:SURFACE.3DS`

By default, `zCArchiver` allows to store properties of the following types:

- **Int** - A regular 32-bit integer. In ASCII mode, int gets stored as `name=int:1`, while in Binary mode, it's just the raw value stored as 4 bytes.

- **Byte** - A 8-bit integer. ASCII mode doesn't differentiate between Int and Byte, so this will be stored as `name=int:1` regardless. Binary mode stores only the single byte.

- **Word** - A 16-bit integer. ASCII mode doesn't differentiate between Int and Word, so this will be stored as `name=int:1` regardless. Binary mode stores only the 2 bytes.

- **Float** - A standard IEEE 754 32-bit floating point number. In ASCII mode the format is `name=float:1.0`, while in Binary mode the float gets stored raw as 4 bytes.

- **Bool** - Stores a single-byte boolean value. In ASCII mode its `name=bool:1` and in Binary mode it's a single byte.

- **String** - An ASCII encoded string. While in ASCII mode, strings are stored as `name=string:value`. In Binary mode, strings are NULL terminated.

- **Vec3** - A three component vector, mainly used to store positional data. The ASCII mode format is `name=vec3:1.0 1.0 1.0`. In Binary mode the three components of the vector are stored in series, which equals to a total size of 12 bytes.

- **Color** - A 32-bit color value stored as BGRA. In ASCII mode the color is stored as `name=color:255 255 255 255` while in Binary mode it's just 4 raw bytes.

- **Raw** - Raw binary data. In order to maintain readability, in ASCII mode this gets stored as a hex encoded string such as `name=raw:63D15B07`. In Binary mode, only the data itself is stored, without any other info. Be aware that due to this you must know the size of the data beforehand.

- **RawFloat** - An array of floats, mainly used to store bounding boxes. In ASCII mode, the floats are stored as `name=rawFloat:1.0 1.0 1.0 1.0 1.0 1.0`. In Binary mode the floats are stored in series as raw bytes. Same as with `Raw`, you must know the size of the array beforehand.

- **Enum** - An enum value. In ASCII mode, it gets stored as `name=enum:1`. In Binary mode, it behaves the same as `Int`.

As you might have noticed, binary mode doesn't perform any kind of checks on if it's reading the right property or even data of the correct type. This is why BinSafe mode exists, as it stores the property type in along with the data itself.

```cpp
enum TYPE
{
    TYPE_STRING        = 0x1,
    TYPE_INTEGER    = 0x2,
    TYPE_FLOAT        = 0x3,
    TYPE_BYTE        = 0x4,
    TYPE_WORD        = 0x5,
    TYPE_BOOL        = 0x6,
    TYPE_VEC3        = 0x7,
    TYPE_COLOR        = 0x8,
    TYPE_RAW        = 0x9,
    TYPE_RAWFLOAT    = 0x10,
    TYPE_ENUM        = 0x11
    TYPE_HASH        = 0x12,
};

struct BinSafeProperty
{
    TYPE type;
    union
    {
        struct
        {
            uint16_t    stringLength;
            char        stringValue[];
        }
        uint32_t    integerOrHashOrEnumValue;
        float        floatValue;
        uint8_t        byteOrBoolValue;
        zVEC3        vec3Value;
        zCOLOR        colorValue;
        struct
        {
            uint16_t    rawLength;
            char        rawValue[];
        }
        struct
        {
            uint16_t    rawFloatLength;
            float        rawFloatValue[];
        }        
    };
};
```

Looking at the enumeration of types, you might notice that BinSafe mode has an additional property type called Hash. BinSafe archives include a hash table which is stored in the following manner:

```cpp
struct BinSafeHashTable
{
    uint32_t chunkCount;
    for (chunkCount)
    {
        uint16_t    stringLength;
        uint16_t    linearValue;
        uint32_t    hashValue;
        char        text[stringLength];
    }
};
```

Instead of storing the raw value, properties may save a hash instead, which is then used to look up the corresponding value from the hash table.

## Implementation

As mentioned in the opening paragraph, classes may use the described functionality by overloading the `Archive` and `Unarchive` virtual methods, which pass an instance of `zCArchiver` by reference. When the class instance is then serialized and/or parsed, these methods are called and perform the desired serialization/parsing work.

The class uses methods provided by the `zCArchiver` instance within these routines. These methods return/accept a value of a specific type (e.g. ReadInt/WriteInt), while they do the actual reading/writing work behind the scenes based on the current mode (ASCII/Binary/BinSafe). The programmer writing the class then does not care whether the final archive will be saved as ASCII, Binary or BinSafe, as they only use the `zCArchiver` Read\* and Write\* methods.

### A practical example

Let's propose that we have a class which is declared like so:

```cpp
class zCMyClass : public zCObject
{
public:

    zCMyClass()                {}
    virtual ~zCMyClass()    {}
    
    virtual void Archive(zCArchiver&);
    virtual void Unarchive(zCArchiver&);

    int myInt;
    zCMyClass* myObject;
    zCMyClass* secondPointerToMyObject;

};

```

The hypothetical class then implements these virtual functions:

```cpp
void zCMyClass::Archive(zCArchiver& archiver)
{
    archiver.WriteInt("myInt", myInt);
    
    archiver.WriteObject("myObject", myObject);
    
    archiver.WriteChunkStart("myChunk", 0);
    archiver.WriteObject("secondPointerToMyObject", secondPointerToMyObject);
    archiver.WriteChunkEnd();
}

void zCMyClass::Unarchive(zCArchiver& archiver)
{
    archiver.ReadInt("myInt", myInt);
    
    myObject = dynamic_cast<zCMyClass*>(archiver.ReadObject("myObject"));
    
    archiver.ReadChunkStart("myChunk");
    secondPointerToMyObject = dynamic_cast<zCMyClass*>(archiver.ReadObject("secondPointerToMyObject"));
    archiver.ReadChunkEnd();
}

```

We then initialize the class in the following way:

```cpp
zCMyClass object;

object.myInt = 12121212;

object.myObject = new zCMyClass();
object.myObject->myInt = 34343434;

object.secondPointerToMyObject = object.myObject;
```

If we now serialized, or to use the engine's term "archived", this instance into an ASCII archive, the result would look like this:

```
ZenGin Archive
ver 1
zCArchiverGeneric
ASCII
saveGame 0
date 3.7.2022 0:0:0
user GMC
END
objects 2     
END

[% zCMyClass 0 0]
    myInt=int:12121212
    [myObject zCMyClass 0 1]
        myInt=int:34343434
        [myObject % 0 0]
        []
        [myChunk % 0 0]
            [secondPointerToMyObject % 0 0]
            []
        []
    []
    [myChunk % 0 0]
        [secondPointerToMyObject § 0 1]
        []
    []
[]
```

Notice how `secondPointerToMyObject` doesn't have any contents. The character `§` tells the parser that this object already exists in the objectList, and that instead of creating a new instance, it should return an existing instance which is stored under index `1` in the objectList.   
This allows an instance to be referenced from multiple places, without the need to worry about duplicity.

If we used Binary or BinSafe mode, we would see a big blob of binary data instead. This would, of course, store the exact same data, although in a slightly less human-readable format.

## Final thoughts

We hope this helps you better understand the inner workings of ZenGin. If you want to see how Piranha Bytes went about implementing a much more advanced version of this system for their next engine, check out [Genome's object persistence system](../../genome/general_info/object_persistence.md).
