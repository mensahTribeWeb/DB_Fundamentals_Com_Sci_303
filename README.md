# DB_Fundamentals_Com_Sci_303
Database Management - Assignment: Database System
Chapter 11 /  Lesson  1
Lesson 
Help 
Course
Instructor: Matt McClintock
Matt has a Bachelor of Arts in English Literature.


Cite this lesson

 Save
19,857 views
Like this lesson
Share
Managing a database can be challenging. This assignment helps students explore database systems and how to manage them. Practice setting up a database, and complete a project to gain understanding of database management.
About this Assignment
Database management systems are key element of information technology systems that are used on a day-to-day basis by many organizations. The keys to using a database management system are to collect the necessary requirements for the database, translate these requirements into a database design, create the database from the design, load data into the database, and finally to perform manipulations of the database. The purpose of this final assignment is to ensure that you understand and can carry out the necessary tasks in order to manage a sample database.

From a high-level standpoint, this final project consists of the following steps:

1. Selection of a database.

2. Identifying the requirements for the database based on the purpose for the database and the data to fill the database.

3. Create a database design based on the requirements for the database, create the physical database, and load data into the database.

4. After loading the database, carry out sample queries that would be performed on the actual database. Show the results of the sample queries.

This project will consist of a series of steps defined in the prompts of the assignment. Some of the prompts are necessary to properly prepare for the manipulation of the database whereas others will be necessary for you to complete to demonstrate your competence with the concepts of this topic. The answers to these prompts will be examined against the actual expected answers to the prompt. All prompts that will be assessed against a answer key, meaning that you will get either full, partial, or no points per prompt.

Setting up the Database/Preparing for this Project
In order to carry out this project it will be necessary for you to set up your access to a database system. The following instructions will explain how to do this.

First, be sure you have MySQL installed and have started the Workbench. Installation instructions for installing a free version of MySQL are located in the lesson Installing MySQL for Database Programming.

Additional Project Preparations
Each prompt will ask you to enter an SQL statement, or to formulate an SQL statement. After entering the SQL statement, a window containing the results of the statement (called a query) will be displayed. This results displayed on this screen will be the answer to the prompt and what will be graded. You are to turn in a word document that contains a series of screen captures that contain the results of an SQL statement. The word document will contain multiple pages, each page containing one or more screen captures associated with the prompt. The screens associated with a prompt should be labeled with some text that indicate the prompt they are associated with.

There are different ways to obtain a screen capture. On a PC you can press the CTRL key and the Print Screen key. Then you can past the captured screen into the document. Pressing Shift-Command-3 on a Mac will capture the current screen on the Mac and place a file of this capture on the desktop.


null

If you drag this icon into the word document, the screen will appear in the word document like so.


null

When you have completed this final project, save the word document with all of your screen captures. This is the file you will submit as your work for the final project.

Final Project Prompts
Prompt 1 - Create the Schema/Database
First, we need to create a database schema in MySQL workbench.

Start the MySQL Workbench. If you followed instructions from the Installing MySQL for Database Programming lesson, the Workbench should load automatically. Launch your local instance and login:


null

null

When MySQL Workbench loads, the Schemas displays on the left-hand side of the window.


null

In the Schemas panel of MySQL, right-click and select Create Schema. Note, you may not have any existing schemas listed; that is OK.


null

Let's call it 'finalproject'. Type the name in and then click the Apply button at the lower-right corner of the window.


null

null

Click Apply at the next screen:


null

Then click Finish


null

Your new schema will appear under the Schemas list. Next, do the following:

Expand the tree
Take a screen capture of it
Paste the screen capture in a Word doc that will contain the rest of your work for this assignment
Label this screen capture 'Prompt 1'
Prompt 2 - Create Tables
Next, we will create a table in order to help us keep track of photographs. As you know, today's digital cameras (and smart phones) can record not only a picture but the GPS location of the picture. We wish to keep this information and eventually display it on a map so we can see where our pictures are located.

We begin by naming some of the data we will keep within our database. For example we would like to keep the name and address of the user of the database, along with their password to access the database. We would also like to keep the city, state, zip code, and telephone number of the person using the database.

From the finalproject schema, create a new table and label it users. The following fields should be created:

userid
name
username
address
city
state
zip
password
We must also think about the data types of each of these attributes in the users table. We can make the data types to be:

userid - numeric, integer, not null, primary key, unique, auto-increment
name - alphanumeric
username - alphanumeric (20 characters)
address - alphanumeric
city - alphanumeric
state - alphanumeric (2 characters)
zip - numeric (integer, 5 digits)
password (alphanumeric)
The second table we will need is the one to hold the locations for people and locations where the photos were taken. This table will be called locations. It needs to contain two items for identification and another two items for the actual location.

itemid - numeric, integer, not null, auto-increment
type - numeric, integer
description - alphanumeric
lng, real
lat, real
In the LOCATIONS table itemid contains either a userid or a photograph id depending what location it represents. The type refers to whether the location entry refers to a person or a photograph. The description is an alphanumeric (textual) field that describes the person or the photograph location. Lastly, lng contains the longitude of the location and lat contains the latitude of the location.

The remaining table is the photograph table. This table contain two fields, one for the photograph (an id), and the second to the location of the photograph. Name this table photographs.

photoid - numeric, integer
locationid - numeric , integer
For the photograph table, use SQL to create the table. In MySQL Workbench, click the icon labeled SQL with the plus sign:


null

In the workbench window, type the correct CREATE TABLE statement to add the photoid and the locationid fields, ensuring the proper type is used.

For each table created, be sure to include SQL statements and capture a screen print.

Prompt 3 - Alter Tables
We wish to make some changes to each of the tables. When a row is created in any of the tables we do not want to allow NULL values.

In order to make a change to a table, the ALTER statement is used. Below is an example of how to modify the users table to ensure the userid is not null:

ALTER TABLE users MODIFY userid INT NOT NULL;

This will change the field userid in the table users so that this field cannot have NULL values.

Create a new SQL statement and modify the following fields so that they are not null.

Table	Field(s)
locations	type, description, lng, lat
users	name, username, password
photograph	photoid, locationid
Paste the SQL statements in the Word document with a heading of Prompt 3 - Alter Tables.

Prompt 4 - Create Index
Next we want to make userid an index for the users table. An index is usually created when a table is created but we can also create the index separately using the CREATE INDEX statement.

CREATE UNIQUE INDEX id ON users (userid);

This statement create an index called id where each KEY will be unique (different from any other). The table users will be used and the index will be based on the first named userid.

Now that the index is created on the users table, add an index for the photograph table. Be sure to use an index identifier that is unique but meaningful (e.g., not xddkrer).

Execute these command(s) in a new SQL creation window. After running the command, right-click on the photograph table in the Schema panel and click Table Inspector. Click the indexes tab and take a screen print. Paste the SQL statements and screen capture under Prompt 4.

Prompt 5 - Enter Data
Now let's enter some data into the database.

We will enter data for the following four individuals.

Userid	name	username	address	city	state	zip	password
1	Bonnie Buntcake	bbunt	6709 Wonder Street	Wonderbread	OH	46106	eclectic
2	Sam Smarf	ssmarf	356 A Street	Beefy	PA	19943	swimming
3	Wendy Grog	wgrog	900 Star Street	Mary	MD	21340	wells
4	Joe Jogger	jjogger	183713 N North Street	Norther	WV	51423	tarts
To enter data into a table you can use the INSERT statement.

INSERT INTO table_name (column1, column2, …)

INSERT INTO users VALUES ('Bonnie Buntcake', 'bbunt', '6709 Wonder Street', 'Wonderbread', 'OH', 46105, 'eclectic');

We don't enter the userid because we set it to an auto-number when we created the table.

To ensure that the data was properly entered we can use the select command to view the data that is in the table users.

SELECT * FROM users;

Or, in MySQL Workbench, you can right-click on the table in the schema and click Select Rows - Limit 1000.

Using the INSERT statement enter the three remaining users into the users table and then display the table with the SELECT * FROM users;

Execute these command(s), then display all records. Capture the screen image of the result of the query, and place it in the word file that will contain all of your screen captures. Label this screen capture Prompt 5.

Prompt 6 - Count Rows
If you want to determine the number of rows in a table you can enter the query

SELECT count(*) from users;

Execute this command and paste the results under Prompt 6.

Prompt 7 - Add Column
In the photograph table we accounted for the id of the location and the id of the photo in the photo library, but we did not include the location of the photographer. We need to add a field to this table to allow this data to be stored. The field will be called userid.

We used the following statement to make this modification to the table. Use the ALTER command with the following syntax:

ALTER TABLE {table name} ADD COLUMN {column} {data type} AFTER {column}

Paste the SQL code in the Word document under Prompt 7.

Next, Inspect the new table, clicking on the Columns tab. Take a screen capture, and place it in the word file that will contain all of your screen captures. Label this screen capture Prompt 7.

Prompt 8 - Issue with New Column
The new column is still incorrect. Can you say how? Hint: How did we modify our columns earlier to ensure data integrity? What data integrity issues will arise if we do not update the column?

Type an answer (100 to 200 words) into the word file containing your screen captures and label this answer Prompt 8.

Prompt 9 - Location and Photograph Table Updates
Next we will define some data for the remaining tables. The locations table and the photographs table still require some data to be defined for them.

The locations table will contain the following data.

itemid	type	description	lng	lat
N/A, will be auto-numbered	1	Independence Hall	794.35	651.43
N/A, will be auto-numbered	2	6709 Wonder Street	323.41	412.22
N/A, will be auto-numbered	1	Sunrise	221.45	132.43
N/A, will be auto-numbered	2	356 A Street	123.32	222.43
N/A, will be auto-numbered	1	Mountains	34.12	87.99
N/A, will be auto-numbered	2	900 Star Street	1071.9	206.45
N/A, will be auto-numbered	1	Moonrise	816.2	111.2
N/A, will be auto-numbered	2	183714 N North Street	176.11	11.176
The photograph table will contain the following data. Be sure the locationid entered matches a location that you created earlier!

photoid	locationid	userid
1	?	1
2	?	1
3	?	3
4	?	4
Execute the proper SQL command(s). Paste both the SQL commands and screen captures of each table under Prompt 9.

Prompt 10 - Users
Now you've created and populated the three tables that make up your database. The next step is to see what we can find out from this database.

First, let's see who is taking pictures. We can do this by selecting the names from the users table.

SELECT name FROM users;

Execute these command(s). When the new screen appears, capture it and place it in the word file that will contain all of your screen captures. Label this screen capture Prompt 10.

Prompt 11 - Who's Taking Pictures?
Now let's see who's actually taken a photo by comparing the list of users to those who have an entry in the photographs table.

SELECT name FROM users, photographs WHERE {where condition}

Complete the WHERE statement, ensuring that you are returning users that have taken pictures (which field(s) are related between the tables?

Execute these command. When the new screen appears, capture it and place it in the word file that will contain all of your screen captures. Be sure to copy the SQL statement as well. Label this screen capture Prompt 11.

Prompt 12 - Unique Names
Notice that this query has told us that Bonnie Buntcake, Wendy Grog, and Joe Jogger all have photos in the photographs table. In the case of Bonnie Buntcake though, she has taken two photos.

Supposing we only want names that are unique, i.e., we are not interested in duplicates - only those who have taken photos. We can add the DISTINCT keyword to the SELECT statement.

Update the SQL statement to only show distinct names.

Execute these command. When the new screen appears, capture it and place it in the word file that will contain all of your screen captures. Be sure to copy the SQL statement as well. Label this screen capture Prompt 12.

Using Sources
Note that this is not a research project in the sense that the only sources to be used are the information contained in the course material. No other sources will be necessary.