# My Circle

**Welcome to My Circe repo**
To view a live version of the app, visit [My circle](https://my-circle.fly.dev/).

## Functionality

A user can sign up/in and then will be asked to create a profile, with optional avatar. 

May then create new posts, which appear on the home feed.

Can send follow requests to other users, and if accepted, their posts also appear in the home feed.

A user can comment on other users' posts. Can also like/remove like on all posts / comments.

## Project Details

In this app I exercise my knowledge on Rails so far. In particular:

* Devise for auth - Setting up basic user authentication and authorization
* Action Mailer - Upon signing up, a new user will receive a welcoming email
* Hotwire / Stimulus
    1) Used for posting / commenting without rerouting, single-page app kind of.
    1) Basic validation for posts, to indicate 250 char limit per post

* Tailwind CSS
* PostgreSQL - Used to store app data
* AWS S3 - Used to store profile avatars.
* CRUD operations for posts/comments, likes, profile, following users.

## External resources used

* Svg buttons by [SVGrepo](https://www.svgrepo.com/)
* Adapted app theme found at [TailwindComponents](https://tailwindcomponents.com/) by [hiravesonali](https://tailwindcomponents.com/u/hiravesonali)
