# Solo Ruby project


## How to load the app

Download the repo and enter the following into the console whilst in the root directory:  

```bash
dropdb tracker  
createdb tracker  
psql -d tracker -f db/tracker.sql  
ruby db/seeds.rb  
ruby app.rb
```

## Basic functionality

The app was written for the solo Ruby project as part of the CodeClan course. It runs on Ruby/Sinatra with a PSQL database and is displayed using vanilla HTML / CSS. You can find the brief [HERE].

The app provides the ability to monitor spending by linking transactions to retailers and categories.  In this way the user can filter transactions to identify and quantify spending habits.

The user is also able to set a budget, and warnings are displayed once spending falls within certain limits.

I had a lot of fun with this project, it helped me identify where I need to get better and re-enforced the  importance of planning.  The presentation I gave in class can be found [HERE].
