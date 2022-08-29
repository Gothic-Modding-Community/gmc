# String function
Functions to manipulate and format strings.
```c++
/// Returns formatted string using format specifiers
/// 
/// Format specifiers:
/// %s - inserts a string
/// %i - inserts a integer number
/// %x - inserts a integer in hexadecimal
/// %f - inserts a floating point number
/// %b - inserts a logical expression
/// %p - inserts a pointer
/// 
/// @return formatted string
func string Str_Format( var string format, ... ) {};

/// Returns a string in the current language, otherwise in English.
/// Arguments MUST be encoded in UTF-8! The result string will be converted to apropriate ANSI string.
///
/// @param russian Russian string
/// @param english English string
/// @param german  German string
/// @param polish  Polish string
///
/// @return string in the current language
func string Str_GetLocalizedString( var string russian, var string english, var string german, var string polish ) {};

/// Returns a string in the current language, otherwise in English.
/// Offers additional languages
///
/// @param russian  Russian string
/// @param english  English string
/// @param german   German string
/// @param polish   Polish string
/// @param czech    Czech  string
/// @param romanian Romanian string
/// @param italian  Italian string
/// @param spanish  Spanish string
///
/// @return string in the current language
func string Str_GetLocalizedStringEx( var string russian, var string english, var string german, var string polish, var string czech, var string romanian, var string italian, var string spanish ) {};

/// Converts UTF-8 string into an ANSI string with codePage
///
/// @param utf8 string encoded in UTF8
/// @param codePage codePage id, can be obtained from Str_GetCurrentCP 
func string Str_UTF8_to_ANSI( var string utf8, var int codePage ) {};

/// Return the code page corresponding to the current language set in the Union System
func int Str_GetCurrentCP() {};

/// Returns the length of a string
///
/// @param str string to be measured
/// @return length of the string
func int Str_GetLength( var int str ) {};
```
