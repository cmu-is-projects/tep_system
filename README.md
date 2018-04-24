# DataCat 

## Overview
**Check out our application deployed at: https://tep-datacat.herokuapp.com/**  
DataCat is a POS system built for [The Education Partnership](https://www.theeducationpartnership.org/), a local nonprofit organization in Pittsburgh. The Education Partnership's mission is to provide free school supplies to teachers, schools and children in the area. TEP has a Resource Center, which is a warehouse full of free school supplies that teachers can come and shop for. They get money and supply donations from different donors and track inventory of these supplies using a Salesforce backend. The purpose of DataCat is to streamline the process of entering teacher shopping data and updating Salesforce inventory accordingly. 

## Data Sync with Salesforce 
One of the biggest things we had to consider when developing this system was the synchronization of data with Salesforce. We used (Heroku Connect)[https://devcenter.heroku.com/articles/heroku-connect] to read and write data to Salesforce. Heroku Connect allows us to poll data from Salesforce at a regular frequency into our Postgres database. To learn more about how Heroku Connect can be used to read data and step by step instructions, check out our Heroku Connect demo using a dummy Rails app here: https://github.com/stephaniepang97/hc_demo.   

Currently, teachers, schools and items are polled every 10 minutes. In Salesforce, these objects are called Contacts, Accounts, and POS Transactions, respectively. After reading them into our database, they are stored as postgres tables in the `salesforce` schema called `salesforce.account`, `salesforce.contact`, and `salesforce.pos_transactions__c`. To filter the data we read and manipulate them so that we can use them in our respective Rails models, we created migrations (stored in the `db/migrate` folder) that create views from these tables called `schools.view`, `teachers.view`, and `items.view`.  

If you are cloning our repo and want to deploy it to your own Heroku account, you will have to run the following commands (assuming you have [Heroku Cli](https://devcenter.heroku.com/articles/heroku-cli) installed already):
```
git clone ...
heroku create 
heroku addons:create herokuconnect:demo
heroku addons:add papertrail
git push heroku master
heroku run rake db:migrate
```
Then you can run `heroku open` to visit the app in your browser, and `heroku pg:psql` to work with your Heroku Postgres database in your terminal.   

## Running Locally 
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
