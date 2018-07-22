# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## Challenge Overview
Build a website for a company that sells subscriptions to legal plans in different countries. The app does not need to be hosted anywhere but should work as expected when run locally.

## Features
- A user should be able to visit a url and see the plans available for a country
- Each plan should display a name and price.
- Each plan should have a "subscribe" button (n0p)
- Clicking on a specific plan should take you to a new page listing the full plan details (plan description, list of benefits (name, description))
- You don't need to spend too much time styling the views

## Requirements
- Build server using Rails 5x
- Use sqlite (its the default db)
- Create a way to seed the database so your work can be checked
- Plans should have different benefits and prices in different countries
- Handle edge cases
- Build a RESTful API with the following resources:
   * GET all plans available for a country (return a list of id, name, price)
   * GET a single plan for a country (return a list of id, name, price and benefit information (benefit name, description))
- Write an integration test for at least one of the routes
- Write some unit tests for your models


## Notes

- Two letter country codes would be a good primary key for a countries table.  Since I don't really need anything but the PK I'm skipping the table; You could say it's implied. I'm choosing ISO ALPHA-2 you could make an argument for ALPHA-3 or UN M49
- I had considered a more normalized structure where you could look up prices and features by a compound key of country & plan but, I don't think that model plays well with AR so I came up with this simplified version which is more de-normalized
- Faker for seeds?
- Not going too far down the internationalization rabbit hole; ex: currency formatting is only supports formatting plans up to 999.99 and formats using identifiers like USD and not $
- You can actually embed your translations in the DB if you're using Postgres & hstore
- Storing price as hundreths is kinda old school but, sqlite3 doesn't have decimal type
- Country and Currency validation?
- Assuming Plans cannot be free
- Can Plans have no benefits?  Can Benefits have no plans?
- Only supports formatting plans up to 999.99 
