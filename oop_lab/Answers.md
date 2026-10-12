# Campus Library System - Answers

**Name:** Huzaifa Qayyum  
**Roll No:** 04072313048  

### Q1. What can a subclass using extends use for free that a class using implements has to write itself?
A class using extends gets the parent's working code and variables for free.
A class using implements only gets the list of method names and must write all the code itself.

### Q2. Book and Dvd both use Renewable. When would you pick a mixin, and when an abstract parent class?
Pick a mixin when different classes just need to share a feature without sharing the same parent.
Pick an abstract parent class when the classes are truly the same kind of thing.

### Q3. Why must you override hashCode whenever you override ==?
Sets and Maps use hashCode first to search for an item. If two equal objects have different hash codes, the Set or Map cannot match them and will save duplicates by mistake.

### Q4. An extension method on String and a subclass of String both add behaviour. Why does Dart let you write the first one but not the second?
Dart locks the String class so no one can change how it works or break its built-in safety. Extension methods do not change the class itself, they just add easy shortcut methods that Dart checks at compile time.