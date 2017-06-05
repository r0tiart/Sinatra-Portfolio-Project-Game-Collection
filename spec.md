# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
- [X] Use ActiveRecord for storing information in a database - active record is used to store into database sqlite3
- [X] Include more than one model class (list of model class names e.g. User, Post, Category) - there are 4 models one for characters, users and games. There is an additional model for the join table
- [X] Include at least one has_many relationship (x has_many y e.g. User has_many Posts) - a user has many games and games have many users
- [X] Include user accounts - Have a login and a register to create new user and sign in
- [X] Ensure that users can't modify content created by other users - I made it so edits or new items do not appear unless the individual signed in matches up with the particular profile page
- [X] Include user input validations - have validation when the Instance tries to be saved
- [X] Display validation failures to user with error message (example form URL e.g. /posts/new) - an error message appears if there is a validation failure
- [X] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code - readme has a description of the app, not install or license are included.

Confirm
- [X] You have a large number of small Git commits - tried to commit every few lines of code or when new method is created
- [X] Your commit messages are meaningful - describe what I added on my commits.. however i believe some might be too long
- [X] You made the changes in a commit that relate to the commit message - the commit messages are based off of what was built and added in the commit
- [X] You don't include changes in a commit that aren't related to the commit message -there shouldn't be any commits that do not have a msg associated with it
