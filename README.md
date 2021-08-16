 # bookmark-manager

User story 1
As a user,
So that I can quickly go to web sites I regularly visit
I'd like to view a list of all my bookmarks in one place

Domain Model:
![image](https://user-images.githubusercontent.com/64266350/129575654-1a69595d-f5bf-440a-9374-b269caa3a010.png)

Anyone setting up the bookmarks database will need to do the following things:

- Connect to psql
- Create the database using the psql command CREATE DATABASE bookmark_manager;
- Connect to the database using the pqsl command \c bookmark_manager;
- Run the query we have saved in the file 01_create_bookmarks_table.sql