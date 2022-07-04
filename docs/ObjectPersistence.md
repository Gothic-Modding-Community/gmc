# Object persistence

In order to simplify the loading and saving data of varying types to the user's hard-drive, ZenGin implements a simple object persistence system using the `zCArchiver` class and its derivatives, that allow individual engine classes to implement a routine specifying which data should be saved or loaded from disk, and in which manner.

An object that is derived from the `zCObject` class may overload the `Archive` and `Unarchive` virtual methods. Within these methods, the class may then call on an interface provided by the `zCArchiver` class, which allows the it to directly read from/write to a stream using several different modes. Primarily these are ASCII and BinSafe, however there are more options, as is explained below.

## Archive format

In order to understand better how this process works, it is best to look at a practical example of a .ZEN file containing an instance of oCWorld.

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

This simply specifies that the following data is a `zCArchiver` archive.

`ver 1`

Version specification. Can be either `0` or `1`. Both Gothic 1 and 2 are already at version 1, although version 0 archives can also be occasionally found.

`zCArchiverGeneric`

Specifies which derived `zCArchiver` class should be used to read this stream. Accepted values are `zCArchiverGeneric` for ASCII and Binary archives, and `zCArchiverBinSafe` for BinSafe archives. More info below.
This property may not be present in older archives.

`ASCII`

This is the most important part of the header, which specifies in which format the data is stored. There are 4 different types:

- **ASCII** - The simplest format which stores data in human-readable ASCII notation (not unlike JSON for example). This is usually used when saving data during development and/or testing, while the final version of said data will most likely be stored as BIN_SAFE.
- **ASCII_PROPS** - Same as ASCII except with more additional data that the developer can specify for visual clarity. In practice, it isn't used anywhere and mostly serves only to pretify debug info (try typing `ZWORLD VOBPROPS` in the console and look in zSpy ;) ).
- **BINARY** - Binary representation of the class instance which mostly copies the data 1:1 into/from the stream. In practice, this format is only used to store savefiles (.SAV).
- **BIN_SAFE** - BinSafe, short for Binary Safe, is an extended version of Binary which stores type information along with the data itself. This is meant to make error checking for invalid data easier. There are also other changes which are explained below. Most if not all world files (.ZEN) are stored in this format.

`saveGame 0`

Specifies if this archive is a savefile. This property may not be present in older archives.

`date 7.1.2001 23:9:19`

The date at which this stream was created.

`user roeske`

The user which created this stream. This property may not be present in older archives.

`END`

Tells the parses that this is the end of the header.

In version 0 archives, we may additionally find a property called `csum` which stores the checksum of the whole stream. However, this property is unused and equals `00000000` by default.

If the archive utilizes `zCArchiverGeneric` then this header will also be followed by a short section specifying the number of object instances in this stream. In older versions, this property would be directly part of the main header. This value will be used to initialize the objectList, which is an array of pointers where the addresses of loaded objects will be stored for later referencing.

```
objects 2594     
END
```

If the archive is created using `zCArchiverBinSafe`, then this data will be stored in the following binary structure:

```cpp
struct BinSafeArchiveHeader
{
	uint32_t version;		// Always equals 2
	uint32_t objectCount;	// Serves the same function as "objects n"
	uint32_t chunkPos;		// Offset to chunk hash table
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

Primarily, we differentiate between 2 different ...

#### Chunks

A chunk is a structure that groups properties together. Most of the time, a chunk represents a class instance, however this is not always true, as classes may arbitrarily create chunks as is needed. For example, the example above contains a chunk called `VobTree`, which does not represent a class instance, but only serves to make the reading of the archive easier.

While in ASCII mode, the start of a chunk is represented using square brackets.

`[% oCWorld:zCWorld 64513 0]`

Inside the start of each chunk, there are 4 pieces of data separated by spaces, which are:

- **Object name** - The name of the chunk to use while reading. If the chunk has no name then it will be simply equal to `%`.
- **Class name** - The name of the class which this chunk represents. Class names are stored with their full inheritance hierarchy (e.g. `oCMobLadder:oCMobInter:oCMOB:zCVob`). In case the chunk is not an object, but an arbitrary chunk, then this field will be equal to `%` (`%` can also mean that this chunk is a nullptr). In some cases you may encounter `§` instead. This means that the object already exists and that the parser should look for it in the objectList using the object index. Using this mechanism, a single instance can be referenced multiple times without worrying about duplicity.
- **Class version** - Used to ensure that the data being read is compatible with the current game/engine version, so that there are no mismatches in the data pattern. This value is different for every class and varies between game versions.
- **Object index** - An index into the objectList under which this object will be stored. If the class name is equal to `§`, then this value will be used to retrieve an existing instance from the objectList.

If this is a Binary archive, the same data will be stored in the following binary structure:

```cpp
struct BinaryObjectHeader
{
	uint32_t	objectSize;		// Size of the whole object in bytes
	uint16_t	classVersion;
	uint32_t	objectIndex;
	char		objectName[];	// Null-terminated string
	char		className[];	// Null-terminated string
};
```

Oddly enough, if the archive is BinSafe, then the data will be encoded the same way as in ASCII mode, except that it will be stored as a property.

```cpp
struct BinSafeStringProperty
{
	uint32_t	type;	// String
	uint16_t	length;	// Length of the text
	char		text[];	// [% oCWorld:zCWorld 64513 0]
};
```

In ASCII mode `[]` represents the end of the current chunk.

#### Properties

Inside the chunks, we find properties that store the actual data saved by the class:

`visual=string:SURFACE.3DS`

In ASCII mode the format is `name=type:value`


## Implementation

### A practical example

Let's propose that we have class which is declared like so:

```cpp
class zCMyClass : public zCObject
{
public:

	zCMyClass()				{}
	virtual ~zCMyClass()	{}
	
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
	archiver.ReadChunkStart();
}

```

We then initialize the class in the following way:

```cpp
zCMyClass object;
object.myInt = 1;
object.myObject = new zCMyClass();
object.myObject->myInt = 1;
object.secondPointerToMyObject = object.myObject;
```

If we now serialized, or to use the engine's term "archived", this instance into an ASCII stream, the result would look like this:

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
	myInt=int:1
	[myObject zCMyClass 0 1]
		myInt=int:1
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

If we used Binary or BinSafe mode, we would see a big blob of binary data instead. This would of course store the exact same data, although in a slightly less human-readable format.
