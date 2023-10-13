# Two Tables Design Recipe Template

_Copy this recipe template to design and create two related database tables from a specification._

## 1. Extract nouns from the user stories or specification

```
As a Maker
So that I can let people know what I am doing
I want to post a message (peep) to chitter

As a maker
So that I can see what others are saying
I want to see all peeps in reverse chronological order

As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made

As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter

Additional Notes
- You don't have to be logged in to see the peeps.
- Users sign up to chitter with their email, password, name and a username (e.g. samm@makersacademy.com, password123, Sam Morgan, sjmog).
- The username and email are unique.
- Peeps (posts to chitter) have the name of the user and their user handle.
- Your README should indicate the technologies used, and give instructions on how to install and run the tests.
```

```
Nouns: 
    Maker, 
    message (peep), 
    time, 
    Chitter, 
    peeps in reverse chronological order

Verbs: 
    Let people know what I'm doing, 
    post, 
    see posts in reverse chronological order
    see what others are saying, 
    sign up for Chitter

```

## 2. Infer the Table Name and Columns

Put the different nouns in this table. Replace the example with your own nouns.



| Record         | Propreties                      |
| ---------------|---------------------------------|
| Users          | email, password, name, username |
| Posts          | message, time, user_id, username |


1. Name of the first table (always plural): `posts` 

    Column names: `message`, `time`, `user_id`, `username`

2. Name of the second table (always plural): `Users` 

    Column names: `email`, `password`, `name`, `username`

## 3. Decide the column types

[Here's a full documentation of PostgreSQL data types](https://www.postgresql.org/docs/current/datatype.html).

Most of the time, you'll need either `text`, `int`, `bigint`, `numeric`, or `boolean`. If you're in doubt, do some research or ask your peers.

Remember to **always** have the primary key `id` as a first column. Its type will always be `SERIAL`.

```
# EXAMPLE:

Table: posts
id: SERIAL
message: text
time: date
username: text
user_id: int

Table: users
id: SERIAL
email: text
password: text
name: text
username: text
```

## 4. Decide on The Tables Relationship

Most of the time, you'll be using a **one-to-many** relationship, and will need a **foreign key** on one of the two tables.

To decide on which one, answer these two questions:

1. Can one [TABLE ONE] have many [TABLE TWO]? (Yes/No)
2. Can one [TABLE TWO] have many [TABLE ONE]? (Yes/No)

You'll then be able to say that:

1. **[A] has many [B]**
2. And on the other side, **[B] belongs to [A]**
3. In that case, the foreign key is in the table [B]

Replace the relevant bits in this example with your own:

```
# EXAMPLE

1. Can one posts have many comments? YES
2. Can one comments have many posts? NO

-> Therefore,
-> An post HAS MANY comments
-> An comment BELONGS TO an post 

-> Therefore, the foreign key is on the commments table.
```

*If you can answer YES to the two questions, you'll probably have to implement a Many-to-Many relationship, which is more complex and needs a third table (called a join table).*

## 5. Write the SQL

```sql
-- EXAMPLE
-- file: albums_table.sql

-- Replace the table name, columm names and types.

-- Create the table without the foreign key first.
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  email text,
  password: text,
  name text,
  username text
);

-- Then the table with the foreign key second.
CREATE TABLE posts (
  id SERIAL PRIMARY KEY,
  message text,
  time datetime,
-- The foreign key name is always {other_table_singular}_id
  username text,
  user_id integer,
  constraint fk_users foreign key(user_id)
    references users(id)
    on delete cascade
);

```

## 6. Create the tables

```bash
psql -h 127.0.0.1 database_name < albums_table.sql
```

<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fdatabases-in-python&prefill_File=resources%2Ftwo_table_design_recipe_template.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fdatabases-in-python&prefill_File=resources%2Ftwo_table_design_recipe_template.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fdatabases-in-python&prefill_File=resources%2Ftwo_table_design_recipe_template.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fdatabases-in-python&prefill_File=resources%2Ftwo_table_design_recipe_template.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fdatabases-in-python&prefill_File=resources%2Ftwo_table_design_recipe_template.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->
