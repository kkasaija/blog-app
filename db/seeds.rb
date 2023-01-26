# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

first_user = User.create(
  Name: 'Tom',
  Photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
  Bio: 'Teacher from Mexico.'
)
second_user = User.create(
  Name: 'Lilly',
  Photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
  Bio: 'Teacher from Poland.'
)

first_post = Post.create(
  Author: first_user,
  Title: 'Hello',
  Text: 'This is my first post'
)

second_post = Post.create(
  Author: first_user,
  Title: 'Welcome',
  text: 'This is my second post'
)

third_post = Post.create(
  Author: first_user,
  Title: 'Praise and Warship',
  Text: 'This is my third post'
)

fourth_post = Post.create(
  Author: first_user,
  Title: 'Resting',
  Text: 'This is my fourth post'
)