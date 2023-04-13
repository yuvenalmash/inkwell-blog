# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

#create users
user1 =
  User.create(
    name: "John Doe",
    bio: "I am a software developer",
    photo: "https://example.com/johndoe.jpg",
    email: "johndoe@example.com",
    password: "password123"
  )
user2 =
  User.create(
    name: "Jane Doe",
    bio: "I am a project manager",
    photo: "https://example.com/janedoe.jpg",
    email: "janedoe@examlple.com",
    password: "password1234"
  )

#create posts
post1 =
  Post.create(
    author: user1,
    title: "Post #1",
    text: "This is my first post on this blog."
  )

post2 =
  Post.create(
    author: user1,
    title: "Post #2",
    text: "This is my second post on this blog."
  )

post3 =
  Post.create(
    author: user1,
    title: "Post #3",
    text: "This is my third post on this blog."
  )

post4 =
  Post.create(
    author: user1,
    title: "Post #4",
    text: "This is my fourth post on this blog."
  )

post5 =
  Post.create(
    author: user1,
    title: "Post #5",
    text: "This is my fifth post on this blog."
  )

post6 =
  Post.create(
    author: user1,
    title: "Post #6",
    text: "This is my sixth post on this blog."
  )

post7 =
  Post.create(
    author: user2,
    title: "Post #1 ;)",
    text: "This is my first post on this blog."
  )

post8 =
  Post.create(
    author: user2,
    title: "Post #2 ;)",
    text: "This is my second post on this blog."
  )

#create comments
comment1 =
  Comment.create(
    author: user2,
    post: post6,
    text: "This is a comment on post #1."
  )

comment2 =
  Comment.create(
    author: user2,
    post: post6,
    text: "This is a comment on post #2."
  )

comment3 =
  Comment.create(
    author: user2,
    post: post6,
    text: "This is a comment on post #3."
  )

comment4 =
  Comment.create(
    author: user2,
    post: post6,
    text: "This is a comment on post #4."
  )

comment5 =
  Comment.create(
    author: user2,
    post: post6,
    text: "This is a comment on post #5."
  )

comment6 =
  Comment.create(
    author: user2,
    post: post6,
    text: "This is a comment on post #6."
  )

# create likes
like1 = Like.create(author: user1, post: post6)

like2 = Like.create(author: user2, post: post6)
