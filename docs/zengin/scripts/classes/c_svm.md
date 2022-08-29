# C_SVM Daedalus class

!!! example "Acknowledgment"
    Heavily inspired by the amazing documentation site [Gothic library](http://www.gothic-library.ru)


The `C_SVM` class is used to define sound dialogues (smalltalk, reactions), that are defined for every [C_NPC.voice]().

## Class definition
`C_SVM` class is the only class with variable number of members. The `C_SVM` definition in the scripts dictates the content of the class. Every Gothic game has a different number of SVM entries. As an interesting information (more than anything else) we include a table with the numbers of voice lines and voices below.

| Game                  | voice lines | voices          |
|-----------------------|------------:|:----------------|
| Gothic 1              |         136 | 17              |
| Gothic Sequel         |         110 | 17 (30 planned) |
| Gothic 2              |         202 | 19              |
| Gothic 2 Addon        |         235 | 19              |
| Chronicles of Myrtana |        1346 | 73              |
| Returning New Balance |         495 | 19              |

## Rules
The number of instances is defined by a constant integer with a specified name read by the engine.
```c++
const int SVM_MODULES = 18;
```
!!! Info
    The value `SVM_MODULES = 18` means 18 SVMs will be parsed by the engine and because the first one `SVM_0` is empty, the final number of voices is 18 - 1 = 17.
Instances of the `C_SVM` class **must** have the name `SVM_XXX`.
```c++
instance svm_1(c_svm)
{
   // ...
};
```
The first instance `svm_0` is always empty, it is used internally by the engine.
```c++
instance svm_0(c_svm) {};
```
## Usage in the scripts
While some of the defined SVMs are used automatically by the engine - the 20 smalltalk lines for example, others are used in the scripts.  
To instruct the engine to run a specific SVM a `AI_OutputSVM` external function is used, in the original scripts it is wrapped in a script function [B_Say](https://github.com/VaanaCZ/gothic-1-classic-scripts/blob/6204f608f506f169035c58552197285bce4ffa39/_work/Data/Scripts/Content/AI/AI_Intern/B_Functions.d#L111-L120).  
To reference the SVM, you use the `$` symbol followed by the name of the member variable in the `C_SVM` class definition.  
```c++ hl_lines="4"
// some code
	{
		PrintScreen	("Not enough skill points!", -1,-1,"FONT_OLD_20_WHITE.TGA",1);
		B_Say (self, other, "$NOLEARNNOPOINTS");
	};
// some code
```
Here the `$NOLEARNNOPOINTS` references the `var string NoLearnNoPoints` in [SVM.D](https://github.com/VaanaCZ/gothic-1-classic-scripts/blob/6204f608f506f169035c58552197285bce4ffa39/_work/Data/Scripts/Content/Story/SVM.d#L125). The voice is then chosen automatically by the engine.
```c++ hl_lines="6"
class C_SVM
{
    //...

    // Lehrer-Kommentare
    var string NoLearnNoPoints;       // NSC-Lehrer verbietet Steigerung - keine Lernpunkte!
    var string NoLearnOverMax;        // NSC-Lehrer verbietet Attribut-Steigerung über 100
    var string NoLearnYouAlreadyKnow; // Du mußt erst Fortgeschritten sein, bevor du ein Meister werden kannst!
    var string NoLearnYoureBetter;    // Du bist jetzt schon besser!

    //...
};
```
