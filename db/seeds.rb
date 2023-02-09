# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
@user1 = User.create(
  name: 'Lilly grace',
  photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
  bio: 'I am a front end developer.', posts_counter: 0
)
@user2 = User.create(
  name: 'Tomd',
  photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
  bio: 'Teacher from Mexico.', posts_counter: 0
)
@post = Post.create(
  user: @user1,
  title: 'Post 1 by Lilly',
  text: 'This is the third post test by Lilly',
  likes_counter: 0,
  comments_counter: 0
)
@post1 = Post.create(
  user: @user1,
  title: 'Post 2 by Lilly',
  text: 'This is the fourth post test by Lilly',
  likes_counter: 0,
  comments_counter: 0
)
@post2 = Post.create(
  user: @user2,
  title: 'Post 2 by Lilly',
  text: 'This is the fourth post test by Lilly',
  likes_counter: 0,
  comments_counter: 0
)
Comment.create(
  author_id: @user1.id,
  post_id: @post.id,
  text: 'my comment'
)
Comment.create(
  author_id: @user2.id,
  post_id: @post1.id,
  text: 'my comment'
)
Comment.create(
  author_id: @user1.id,
  post_id: @post2.id,
  text: 'my comment'
)
Comment.create(
  author_id: @user2.id,
  post_id: @post.id,
  text: 'my comment'
)