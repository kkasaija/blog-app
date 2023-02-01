first_user = User.create!(
  Name: 'Tom',
  Photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
  Bio: 'Teacher from Mexico.'
)

second_user = User.create!(
  Name: 'Lilly',
  Photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
  Bio: 'Teacher from Poland.'
)

first_post = Post.create!(
  user: first_user,
  Title: 'Hello',
  Text: 'This is my first post'
)

Comment.create!(
  post: first_post,
  user: second_user,
  Text: 'Hi Tom!'
)