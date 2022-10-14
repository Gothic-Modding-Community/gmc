# Object persistence

!!! note "Warning about Risen 2, 3 and ELEX 1 and 2"

	 The following information only applies to the games Gothic 3 (2006) and Risen (2009). While newer Genome engine games share the same overall concepts, they have very important implementation details that would make them require their own section.

Due to the nature of the program, the engine is required to store and load a vast amount of different types of data from the user's hard-drive. In order to streamline this parsing and/or serialization process, Genome implements an object persistence system using its own built-in runtime type information (RTTI) system.

By using special preprocessor macros, any class derived from `bCObjectBase` may declare its own member properties in such a way that when the object is then written into a file using the `bCAccessorPropertyObject` class, its associated properties will be automatically serialized into the stream. When the object is then read back from the file, the class will be automatically initialized using the stored members.

Additionally, classes may overload the `Read` and `Write` (`OnRead` and `OnWrite` in Risen 1) virtual methods, that allow the class to save additional data required during parsing (such as paths to other necessary files).

As this system is quite flexible, it is used to store most of the game's data, from meshes, animations and textures to level and quest data. This is quite different from ZenGin, as [its object persistence system](../zengin/general_info/ObjectPersistence.md) is only used for worlds, saves, output units and parts of compiled meshes.

## File format

### Files

``` cpp
struct bCIOStream
{
	char data[];
};
```

``` cpp
struct eCArchiveFile
{
	char8_t  magic[8];  // "GENOMFLE"
	uint16_t version;   // 0001
	uint32_t offset;
	
	char data[];
	
	uint32_t magic;	// DEADBEEF
	uint8_t  version;  // 01
	uint32_t count;
	for( Count )
	{
		uint16_t length;
		char8_t  string[length];  // (ASCII)
	}
};
```


### bCAccessorPropertyObject

``` cpp
bCAccessorPropertyObject::Read 
{
	uint16_t	version;	// 0x0001
	bool		hasPropertyObject;
	if (hasPropertyObject)
	{
		bCPropertyObjectSingleton::ReadObject
		{
			uint16_t	version;	// 0x0001
			bool		isPersistable;	// 0x01 (GETrue)
			bCString	className;
			bCPropertyObjectFactory::ReadObject
			{
				uint16_t	version;		// 0x0001
				bool		isRoot;			// 0x00 (GEFalse)
				uint16_t	classVersion;
				bTPropertyObject<%,%>::Read
				{
					bCPropertyObjectBase::Read
					{
						uint16_t version;	// 0x00C9 (201)
					}
					uint32_t size;
				}
				bTPropertyObject<%,%>::ReadData
				{
					bCPropertyObjectBase::ReadData
					{
						uint16_t version;	// 0x00C9 (201)
						uint32_t count;
						for (count)
						{
							bCString	name;
							bCString	type;
							uint16_t	version;	// 0x001E (30)
							uint32_t	size;
							uint8_t		value[size];
						}
					}
					%::Read
					{
						// ClassName::OnRead/OnWrite()
						// uint16_t ClassVersion; ...
					}
				}
			}
		}
	}
}
```

### eCProcessibleElement


=== "Gothic 3"

	```dae
	eCProcessibleElement::Load
	{
		uint32_t magic; // 0xD0DEFADE
		bCAccessorPropertyObject::Read
		{
			// Look above for bCAccessorPropertyObject definition
		}
	}
	```

=== "Risen"

	```dae
	eCProcessibleElement::Load
	{
		bCAccessorPropertyObject::Read
		{
			// Look above for bCAccessorPropertyObject definition
		}
	}
	```

## Implementation

### A practical example

Let's propose that we have a class which is declared like so:

```dae
class gCMyClass : public bCObjectRefBase
{
public:

	gCMyClass()				{}
	virtual ~gCMyClass()	{}
		
	virtual bEResult Write(bCOStream&); // OnWrite for Risen
	virtual bEResult Read(bCIStream&);  // OnRead for Risen

private:

	DECLARE_PROPERTY(myInt, int);
	
	int someData;

};

```

The hypothetical class then implements these virtual functions:

```dae
bEResult gCMyClass::Write(bCOStream& file)
{
	file << someData;
	return bEResult_Ok;
}

bEResult gCMyClass::Read(bCIStream& file)
{
	file >> someData;
	return bEResult_Ok;
}

```

We then initialize the class in the following way:

```dae
gCMyClass object;
object.myInt = 1;
object.someData = 1;
```

If we now serialized, or to use the engine's term "archived", this instance into an ASCII stream, the result would look like this:

```

```
