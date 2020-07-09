# Film Club

### Developed by Alex Beciana

## Specs

* VSCode Text Editor
* [RapidAPI](https://rapidapi.com/rapidapi/api/movie-database-imdb-alternative)
* Microsoft OneNote for model sketching
* GitKraken Boards and Timeline for task/project management

## Language
* Ruby v.2.6.1

### Gems Used
* `gem "activerecord", '~> 5.2'`
* `gem "sinatra-activerecord"`
* `gem "sqlite3", '~> 1.3.6'`
* `gem "pry"`
* `gem "require_all"`

## How to Run the Application

- [ ] Open your terminal

- [ ] Make sure that your are in the parent directory

- [ ] Run `bundle install` in your terminal to make sure you have all of the necessary gems installed

- [ ] Run `rake db:migrate` to migratae tables to set up the database tables

- [ ] Run `rake db:seed` to populate the database tables with sample data

- [ ] To test that everything works, you may run `rake cosole` to make sure sample data has been added

- [ ] Run `ruby bin/run.rb` within your terminal

## Structure

### Class Models

#### Member
* A member can have many clubs, through ClubMember.

#### Club
* A club can have many members, through ClubMember.
* A club can have many movies, through MovieClub.

#### Movie
* A movie can have many clubs, through MovieClub.

### Joiner Models

#### ClubMember
* ClubMember can have many clubs.
* ClubMember can have many members.
* ClubMember belongs to clubs.
* ClubMember belongs to members.

#### MovieClub
* MovieClub can have many clubs.
* MovieClub can have many movies.
* MovieClub belongs to clubs.
* MovieClub belongs to movies.

## User Stories
* As a user, I want to read and know which clubs are available to join.
* As a user, I want to create an account and be able to login after creating it.
* As a user, I want to join a movie club.
* As a user, i want to remove my association with a certain club.

## API

* [RapidAPI - Movie Database (IMDB Alternative)](https://rapidapi.com/rapidapi/api/movie-database-imdb-alternative)

## Inspiration
My friend Russell was a major inspiration for this project. Since the start of the pandemic, he started the Pandemic Film Club and I'm proud to be a member. Every Friday night without fail, a group of about 10 friends, some old and some new, join remotely to talk, laugh, and discusss films. This is something that I know look forward to each week.



## Learning Accomplishments / Benchmarks
Learning about SQL, ORMs, and ActiveRecord over the July 4th weekend and into Tuesday night was feat in and of itself. However, the practice and process of learning by doing (and failing) helped get me well accustomed to the material and fixing the errors I came across.

Prior to this project, I had never used an API in code before. (I have a lot of experience using Zapier.). Luckily, RapidAPI provided code to implement and then I used the knowledge I have work with nested data strcutures and break things down to meet my expectations.

Learning to ask for help when needed. Big thanks to Duke Ko, Michael Horowitz, Kyle Burda, Julia Zhou, and Jamie Wittenberg for having patience and taking the time.

## Goals
The goal is to keep building on this project with a frontend and add more functionality that would allows users to post about movies and reviews. 