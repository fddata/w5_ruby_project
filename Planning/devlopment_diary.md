### Development Diary
___
___

**2018_08_10 - Friday**

AM: Planning for Money Tracker, creating UX files (profiles, needs, MOSCOW and journeys).  Some simple layout sketches (freehand on paper, will add finalised .xmls at end).

PM: DB and Class diagrams, spent afternoon/evening creating the sql file and getting as far as I could on CRUD methods for my 4 classes.

Unsure if I will use the User class at the moment... but it seems to be the easiest way to incorporate the Budget feature I would like to add.

Mood: slightly worried I won't have enough time to do everything _and_ make the app look nice! Still optimistic though.
***

**2018_08_12 - Sunday**

Added views for transactions, merchants and categories.  Added a view of all transactions and discovered the in-built @transactions.sum(&:amount) method.

***
**2018_08_13 - Monday**

AM:  Worked towards MVP.  Took surprisingly long to do all of the new, create, edit, update and  delete methods for each of the 3 classes!

PM:  Reached MVP, then discovered it is much tidier to have separate controller files for each of the classes and run it all from a central app.rb file.  Went back in to tidy it up, my controllers and views folder are _much_  easier to read now!



***
**2018_08_14 - Tuesday**

AM: tried to teach myself flexbox and apply _very simple_ styling to my site.  Took all day but managed to get a simple view I was happy with.

PM:  Added the logic for the budget check extension, basically injects a little css into the html to change the colour depending on the budget.amount value.



***
**2018_08_15 - Wednesday - Submission Day**

AM: realised the homepage fell over if there were no transactions present.  Added some simple logic that checks to see if there are any transactions then displays 'No Transaction' if not.  Took longer than it should have as I didn't understand the error message that told me the function was returning 'nil'.

PM: Worked on presentation.  

Need to add:
tests
 a footer and a way to avoid duplicate merchants / categories.


Presentation:
Talk about project and planning
- is built for who?  User? protos
- site map
a little demo
Some troublesome code / proud of etc
 - budget overview (cell within cell, warning methods etc)
 - view by merchant / category etc - subspending overview
 - sort buttons (different styling to show different use)

What didn't work - the fact I didn't do a proper wireframe!
What do you want to do from here? - colour coded methods / nicer forms / duplicate entries

Diagrams:
Class diagrams (pure ruby, box for each class, properties and datatype, methods)

***
**User action**


**System Response**

***
**User action**


**System Response**

***
**User action**


**System Response**

***
