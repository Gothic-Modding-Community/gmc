# Object persistence

Due to the nature of the program, the engine is required to store and load a vast amount of different types of data from the user's hard-drive. In order to streamline this parsing and/or serialization process, ZenGin implements a persistence system using the `zCArchiver` class and its derivatives, that allows individual engine classes to implement a routine specifying which data should be saved or loaded from disk, and in which manner.

By calling on an interface provided by the `zCArchiver` class, a class (which must be derived from `zCObject`) can write data directly into a stream using several different modes. Primarily these are ASCII and BinSafe, however more is explained below.

## Archive format

In order to understand better how this process works, it is best to look at a practical example of a .ZEN file containing an instance of oCWorld.

### Header

If you open up a file containing a serialized engine class instance, you will see the following at the start of the file:

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

Let's look at each of these properites and what they mean:

`ZenGin Archive`

This simply specifies that the following data is a `zCArchiver` archive.

`ver 1`

Version specification. Can be either `0` or `1`. Both Gothic 1 and 2 are already at version 1, although version 0 archives can also be occasionally found.

`zCArchiverGeneric`

Specifies which derived `zCArchiver` class should be used to read this stream. Accepted values are `zCArchiverGeneric` for ASCII and Binary archives, and `zCArchiverBinSafe` for BinSafe archives. More info below.

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

```
objects 2594     
END
```

If the archive utilizes `zCArchiverGeneric` then this header will also be followed by a short section specifying the number of object instances in this stream. In older versions, this property would be directly part of the main header. If the archive is created using `zCArchiverBinSafe`, then this data will be stored in a binary structure, however it will still be there.


In version 0 archives, we may also find a property called `csum` which stores the checksum of the whole stream. However, this property is unused and equals `00000000` by default.

### Contents

## From the class' point of view

Let's propose that we have class which is declared like so:

```cpp
class zCMyClass : public zCObject
{
public:

	zCMyClass()				{}
	virtual ~zCMyClass()	{}
	
	virtual void Archive();
	virtual void Unarchive();

private:

	int myInt;
	zCMyClass* myObject;
	zCMyClass* secondPointerToMyObject;

};

```

The hypothetical class then implements these virtual functions:

```cpp
void zCMyClass::Archive(zCArchiver& archiver)
{
	archiver.WriteInt("myInt", &myInt);
	archiver.WriteObject("myObject", &myObject);
	archiver.WriteObject("secondPointerToMyObject", &secondPointerToMyObject);
}

void zCMyClass::Unarchive(zCArchiver& archiver)
{
	archiver.ReadInt("myInt", &myInt);
	archiver.ReadObject("myObject", &myObject);
	archiver.ReadObject("secondPointerToMyObject", &secondPointerToMyObject);
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
		[secondPointerToMyObject % 0 0]
		[]
	[]
	[secondPointerToMyObject § 0 1]
	[]
[]
```

Notice how `secondPointerToMyObject` doesn't have any contents. The character `§` tells the parser that this object already exists in the objectList, and that instead of creating a new instance, it should return an existing instance which is stored under index `1` in the objectList. 
This allows an instance to be referenced from multiple places, without the need to worry about duplicity.

If we used Binary or BinSafe mode, we would see a big blob of binary data instead. This would of course store the exact same data, although in a slightly less human-readable format.
