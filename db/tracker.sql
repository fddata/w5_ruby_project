DROP TABLE transactions; -- Drop the 'many' tables first
DROP TABLE merchants;
DROP TABLE categories;
DROP TABLE users;
DROP TABLE budgets;

--Create the 'one' tables first, then the 'many' tables last.
CREATE TABLE users(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  budget FLOAT
);

CREATE TABLE budgets(
  id SERIAL PRIMARY KEY,
  total FLOAT,
  time_stamp TIMESTAMP
);

CREATE TABLE merchants(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE categories(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE transactions(
  id SERIAL PRIMARY KEY,
  amount FLOAT,
  time_stamp TIMESTAMP,
  user_id INT REFERENCES users(id) ON DELETE CASCADE,
  merchant_id INT REFERENCES merchants(id) ON DELETE CASCADE,
  category_id INT REFERENCES categories(id) ON DELETE CASCADE);
