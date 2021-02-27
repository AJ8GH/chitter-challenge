require 'rake'

desc 'Setup database connection'
task :setup_database_connection do
  if ENV['ENVIRONMENT'] = 'test'
    DatabaseConnection.setup('chitter_test')
  else
    DatabaseConnection.setup('chitter')
  end
  puts '* Connected to test database *'
end

desc 'Clean test database'
task :clean_test_database do
  puts 'cleaning test database...'
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec('TRUNCATE users, peeps RESTART IDENTITY;')
end

desc 'Create chitter and chitter_test databases'
task :setup do
  %w[chitter chitter_test].each do |database|
    connection = PG.connect
    connection.query("CREATE DATABASE #{database};")
  end
end

desc 'Create database tables for users and peeps'
task :migrate do
  %w[chitter chitter_test].each do |database|
    connection = PG.connect(dbname: database)

    connection.exec(
      "CREATE TABLE users(
        id SERIAL PRIMARY KEY,
        name VARCHAR (60) NOT NULL,
        username VARCHAR (60) UNIQUE NOT NULL,
        email VARCHAR (255) UNIQUE NOT NULL,
        password VARCHAR (80) NOT NULL
      );"
    )

    connection.exec(
      "CREATE TABLE peeps(
        id SERIAL PRIMARY KEY,
        content VARCHAR (280) NOT NULL,
        user_id INTEGER REFERENCES users (id),
        time TIMESTAMP DEFAULT CURRENT_TIMESTAMP (0)
      );"
    )
  end
end
