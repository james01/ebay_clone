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
  listing_id INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(255) NOT NULL,
  description VARCHAR(255) NOT NULL,
  minimum_price INT NOT NULL,
  initial_price INT NOT NULL,
  bid_increment INT NOT NULL,
  start_date DATETIME NOT NULL,
  end_date DATETIME NOT NULL,
  seller VARCHAR(255) NOT NULL REFERENCES users(username),
  category VARCHAR(255) NOT NULL,
  category_props JSON NOT NULL
);

DROP TABLE IF EXISTS bids;
CREATE TABLE bids (
  amount INT NOT NULL,
  placed DATETIME NOT NULL,
  is_secret BOOLEAN NOT NULL,
  placed_on INT NOT NULL REFERENCES listings(listing_id),
  placed_by VARCHAR(255) NOT NULL REFERENCES users(username),
  PRIMARY KEY(amount, placed_on, placed_by)
);

INSERT INTO users VALUES ('admin', 'admin', 'admin@admin.com', 3);
INSERT INTO users VALUES ('james01', 'abc123', 'james@email.com', 1);

INSERT INTO listings VALUES (
  DEFAULT,
  'My first listing',
  'This is my first listing',
  100,
  100,
  10,
  NOW(),
  NOW() + INTERVAL 1 DAY,
  'james01',
  'Car',
  '{"Miles": 200, "Color": "Red"}'
);
INSERT INTO listings VALUES (
  DEFAULT,
  'My second listing',
  'This is my second listing',
  100,
  100,
  10,
  NOW(),
  NOW() + INTERVAL 1 DAY,
  'james01',
  'Boat',
  '{"Crew Size": 2}'
);

INSERT INTO bids VALUES (
  110,
  NOW(),
  FALSE,
  1,
  'james01'
);
