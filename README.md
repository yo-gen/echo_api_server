# README

This README documents whatever steps are necessary to get the
application up and running.

* Ruby version
3.1.2

* Rails version
7.0.6

* System dependencies
PostgreSQL v10 or above

* Database creation

```rails db:create```

* Database initialization

```rails db:migrate```

* How to run the app

Install gems using

```
bundle install
```

Run the server by using command

```
rails s
```

* How to run the test suite (This project uses Rails default test suite MiniTest for testing)

```
rails db:create RAILS_ENV=test
rails db:schema:load RAILS_ENV=test
rails test
```
