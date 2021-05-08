CREATE TABLE posts(
  id SERIAL PRIMARY KEY,
  content VARCHAR (280) NOT NULL,
  user_id INTEGER REFERENCES users (id),
  time TIMESTAMP DEFAULT CURRENT_TIMESTAMP (0)
);