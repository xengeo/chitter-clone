-- The job of this file is to reset all of our important database tables.
-- And add any data that is needed for the tests to run.
-- This is so that our tests, and application, are always operating from a fresh
-- database state, and that tests don't interfere with each other.

DROP TABLE IF EXISTS posts;
DROP SEQUENCE IF EXISTS posts_id_seq;

DROP TABLE IF EXISTS users;
DROP SEQUENCE IF EXISTS users_id_seq;


CREATE SEQUENCE IF NOT EXISTS users_id_seq;
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  email text,
  password text,
  name text,
  username text
);

CREATE SEQUENCE IF NOT EXISTS posts_id_seq;
CREATE TABLE posts (
  id SERIAL PRIMARY KEY,
  message text,
  time date,
-- The foreign key name is always {other_table_singular}_id
  username text,
  user_id integer,
  constraint fk_users foreign key(user_id)
    references users(id)
    on delete cascade
);