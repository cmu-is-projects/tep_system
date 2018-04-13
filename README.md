# DataCat 

To set up or reset local postgres database, make sure you have postgres installed and running, then do:
```
rails db:drop 
rails db:setup
```
The `rails db:setup` command will create, migrate and seed (populate) the database with csv files of Teacher and School located in `lib/seeds/`. Seeding the teachers will take a while.

If default user is not showing locally, run: 
```
bundle exec rake db:migrate:redo
```
