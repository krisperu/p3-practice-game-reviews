# Phase 3 Active Record Mock Code Challenge: Game Reviews

For this assignment, we'll be working with a video games domain.

We're building a site that will allow a user to add games to a favorites list and write reviews about video games.

We are given three models: `User`, `Game`, and `Category`

## Core Deliverables

**For the purposes of the core deliverables, a `User` can write reviews for many `Game`s and a `Game` can receive reviews from many `User`s.**

`User` - `Game` is a many to many relationship.

`Category` -  `Game` is a one to many relationship.

You will need more relationships. What are they?

**Note**: You should draw your domain on paper or on a whiteboard _before you
start coding_. Remember to identify a single source of truth for your data.

**Note**: This mock code challenge is _more_ challenging than the actual code challenge, especially with the advanced deliverables.


## Topics

- Active Record Migrations
- Active Record Associations
- Class and Instance Methods
- Active Record Querying

## Instructions

To get started, run `bundle install` while inside of this directory.

Build out all of the methods listed in the deliverables. The methods are listed
in a suggested order, but you can feel free to tackle the ones you think are
easiest. Be careful: some of the later methods rely on earlier ones.

**Remember!** This code challenge does not have tests. You cannot run `rspec`
and you cannot run `learn`. You'll need to create your own sample instances so
that you can try out your code on your own. Make sure your associations and
methods work in the console before submitting.

We've provided you with a tool that you can use to test your code. To use it,
run `rake console` from the command line. This will start a `pry` session with
your classes defined. You can test out the methods that you write here. You are
also encouraged to use the `seeds.rb` file to create sample data to test your
models and associations.

Writing error-free code is more important than completing all of the
deliverables listed - prioritize writing methods that work over writing more
methods that don't work. You should test your code in the console as you write.

Similarly, messy code that works is better than clean code that doesn't. First,
prioritize getting things working. Then, if there is time at the end, refactor
your code to adhere to best practices.

**Before you submit!** Save and run your code to verify that it works as you
expect. If you have any methods that are not working yet, feel free to leave
comments describing your progress.

## What You Already Have

The starter code has migrations and models for the initial `User`, `Game` and `Category`
models, and seed data for some `User`s, `Game`s and `Category`(ies). The schema currently looks
like this:

### users Table

| Column        | Type    |
| ------------- | ------- |
| username      | String  |
| email         | String  |

### games Table

| Column    | Type   |
| ------    | ------ |
| name      | String |
| platform  | String |

### categories Table

| Column    | Type   |
| ------    | ------ |
| name      | String |


You will need to create migrations for additional tables using the
attributes specified in the deliverables below.

## Deliverables

Write the following methods in the classes in the files provided or additional model classes you need to create. Feel free to
build out any helper methods if needed.

Deliverables use the notation `#` for instance methods, and `.` for class
methods.

Remember: Active Record give your classes access to a lot of methods already!
Keep in mind what methods Active Record gives you access to on each of your
classes when you're approaching the deliverables below.

### Migrations

Before working on the rest of the deliverables, you will need to create more
migrations. Let's start with a migration for the `review` table.

- A `Review` belongs to a `User`, and a `Reveiw` also belongs to a `Game`.
  In your migration, create any columns your `reviews` table will need to
  establish these relationships using the right foreign keys.
- The `reviews` table should also have:
  - A `content` column that stores a string.
  - A `rating` column that stores an integer (1-5).

After creating the `reviews` table using a migration, use the `seeds.rb` file to
create instances of your `Review` class so you can test your code.



**Once you've set up your tables**, work on building out the following
deliverables.

### Object Association Methods

Use Active Record association macros and Active Record query methods where
appropriate (i.e. `has_many`, `has_many through`, and `belongs_to`).

#### Review

- [x] `Review#user`
  - returns the `User` instance for this Review
- [x] `Review#game`
  - returns the `Game` instance for this Review

#### User

- [x] `User#reviews`
  - returns a collection of all the reviews for the User
- [x] `User#games`
  - returns a collection of all the games reviewed by the User

#### Game

- [x] `Game#users`
  - returns a collection of all users who have reviewed the Game 
- [x] `Game#reviews`
  - returns a collection of all the reviews of that Game 

#### Category

- [x] `Category#games`
    - returns a collection of all the games that belong to a given category

Use `rake console` and check that these methods work before proceeding. For
example, you should be able to call `User.first.reviewed_games` and see a list of the
games reviewed by the first user in the database based on your seed data; and
`Review.first.user` should return the user for the first review in the database.

### Aggregate and Association Methods

#### Review

- [x] `Review#print_details`
  - should return a string formatted as follows:
    `{insert user's name} gives {insert games's item_name} {insert review's rating} stars: {insert review's content}`

#### User

- [] `User#write_review(game, content, rating)`
  - takes a `game` (an instance of the `Game` class), some `content` (string), and a `rating` integer
    as arguments, and creates a new `Review` instance associated with this
    User and the given Game
- [] `User.most_reviews`
  - returns the `User` instance with the most reviews associated with it

#### Game

- [] `Game#average_rating`
  - returns the average ratings from a game's reviews as a float, or the string 'No ratings yet'
- [] `Game.find_by_platform(platform)`
  - accepts a platform string and returns a collection of `Game` instances that are for that platform

#### Category

- [] `Category#platforms`
    - returns a collection (strings) of the platforms available for a given category without duplicate strings
- [] `Category.highest_rated`
    - returns a category instance connected to the game with the highest current rating
    - (for Advanced Deliverables, we'll have to allow this method to return an array of categories)

## Advanced deliverables
Only attempt these when you have completed and tested the deliverables above.  Be sure you have made a commit of the working code before starting on advanced deliverables.

We're going to expand on our model associations now.

**A `User` can favorite many `Game`s and a `Game` can be favorited by many `User`s. A `Game` can have many `Category`(ies) and a `Category` can have many `Game`s.**

What other table or tables will you need to create so that users can favorite many games and games can have multiple categories? Review the relationships just described and update your Entity Relationship Diagram (ERD). Do you need to update anything in the existing code to make this work?

### Object Association Methods

#### User
- `User#favorites`
  - returns a collection of all the games favorited by the User
  - (at this point, you may run into an issue, you haven't encountered up until now: how in the world can you define more than one `has_many, through:` associations that join the same two models through different join models? You'll want to look into [association aliases](https://www.theodinproject.com/paths/full-stack-ruby-on-rails/courses/ruby-on-rails/lessons/active-record-associations))

#### Game
- `Game#favoriters`
  - returns a collection of all the users who have favorited that Game
  - (see the above on how to alias your associations)
- `Game#categories`
    - returns a collection of the game's categories

### Aggregate and Association Methods

#### User
- `User#add_favorite(game)`
  - takes a `game` (an instance of the `Game` class), 
    as an argument, and creates the proper association between this
    User and the given Game
    
#### Game
- `Game#add_category(category)`
  - accepts a `category` (instance) and associates it with the Game it's called on
- `Game.most_popular`
  - returns the game instance that has been favorited by the most users

#### Category
- `Category.most_popular`
    - returns a category instance based on the current most-popular game
