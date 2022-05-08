CREATE DATABASE IF NOT EXISTS eBayClone;
USE eBayClone;

DROP TABLE IF EXISTS users;
CREATE TABLE users (
  username VARCHAR(255) PRIMARY KEY,
  password VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  permissions INT NOT NULL
);

DROP TABLE IF EXISTS listings;
CREATE TABLE listings (
  listing_id INT PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  description VARCHAR(255) NOT NULL,
  minimum_price INT NOT NULL,
  initial_price INT NOT NULL,
  current_price INT NOT NULL,
  bid_increment INT NOT NULL,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL,
  seller VARCHAR(255) NOT NULL REFERENCES users(username)
);

DROP TABLE IF EXISTS bids;
CREATE TABLE bids (
  amount INT NOT NULL,
  placed DATE NOT NULL,
  is_secret BOOLEAN NOT NULL,
  placed_on INT NOT NULL REFERENCES listings(listing_id),
  placed_by VARCHAR(255) NOT NULL REFERENCES users(username),
  PRIMARY KEY(amount, placed_on, placed_by)
);

INSERT INTO users VALUES ('james01', 'abc123', 'james@email.com', 1);
INSERT INTO listings VALUES (
  1,
  'My first listing',
  'This is my first listing',
  100,
  100,
  100,
  10,
  '2022-05-11',
  '2022-05-12',
  'james01'
);
INSERT INTO listings VALUES (
  2,
  'My second listing',
  'This is my second listing',
  100,
  100,
  100,
  10,
  '2022-05-11',
  '2022-05-12',
  'james01'
);