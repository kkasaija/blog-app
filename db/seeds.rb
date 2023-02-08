# 8.times do |user|
#   @user = User.create!(
#     name: "UserNumber#{user + 1}",
#     photo: "https://unsplash.com/photos/F_-0BxGuVvo",
#     bio: "Software Developer from Uganda, Kampala."
#   )

#   8.times do |post|
#     @post = Post.create!(
#       user: @user,
#       title: "This is post No: #{post + 1}",
#       text: "Kelley: He's our coach now. This is what we've got to work on so that we can make a big difference. That's what I'm doing now, we've made a lot of progress. It's good. He has done a lot over those last three weeks, is a really good player, he's really hard working, we had some positive sessions with some other players with our international team too."
#     )

#     8.times do |comment|
#       Comment.create!(
#         post: @post,
#         user: @user,
#         text: "This is comment number #{comment + 1}",
#       )
#     end
#   end
# end
