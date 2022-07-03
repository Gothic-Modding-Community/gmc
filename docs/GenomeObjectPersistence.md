# Object persistence


### A practical example

Let's propose that we have class which is declared like so:

```cpp
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

```cpp
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

```cpp
gCMyClass object;
object.myInt = 1;
object.someData = 1;
```

If we now serialized, or to use the engine's term "archived", this instance into an ASCII stream, the result would look like this:

```

```
