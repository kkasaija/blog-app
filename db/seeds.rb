user1 = User.create!(
  Name: 'Kisembo Annet',
  Photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
  Bio: 'Trader from Uganda, Kampala.'
)

user2 = User.create!(
  Name: 'Kenneth Kasaija',
  Photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
  Bio: 'Originally a Munyoro, turned Mutooro.'
)

10.times do |post|
  @user1_post = Post.create!(
    user: user1,
    Title: "This is my post No: #{post + 1}",
    Text: "Kelley: He's our coach now. This is what we've got to work on so that we can make a big difference. That's what I'm doing now, we've made a lot of progress. It's good. He has done a lot over those last three weeks, is a really good player, he's really hard working, we had some positive sessions with some other players with our international team too."
  )
end

10.times do |post|
  @user2_post = Post.create!(
    user: user2,
    Title: "This is my post No: #{post + 1}",
    Text: "Devin: He's just a very good player with the ball. He has such a great attitude, he's been looking for a while, working hard. He knows what he is doing, the only time he's been on that stage has been with me with his back to goal play the final ten minutes. I'm enjoying the game."
  )
end

# Comment.create!(
#   post: first_post,
#   user: first_user,
#   Text: 'Hi Tom!'
# )

10.times do |comment|
  Comment.create!(
    post: @user1_post,
    user: user1,
    Text: "This is my comment number #{comment + 1}",
  )
end

10.times do |comment|
  Comment.create!(
    post: @user2_post,
    user: user2,
    Text: "This is my comment number #{comment + 1}",
  )
end
