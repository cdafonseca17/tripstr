
puts 'creating seeds'
User.destroy_all


User.create(
  username: 'cdafonseca',
  email: 'dafonseca.ca@gmail.com',
  password: '12345678',
  first_name: "Caroline",
  last_name: "Da Fonseca",
  home_city: "Amsterdam"
  )

User.create(
  username: 'rvisser',
  email: 'rvisser@gmail.com',
  password: '12345678',
  first_name: "Richard",
  last_name: "Visser",
  home_city: "Amsterdam"
  )

# 5.times do
#   user = User.new(
#     username: Faker::Internet.username,
#     email: Faker::Internet.email,
#     password: Faker::Internet.password(min_length: 8, max_length: 40),
#     first_name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name,
#     home_city: Faker::Address.city,
#     )
#   user.save!
# end


trips = [
{
  name: "Netherlands",
  user_id: 1,
  start_date: ["13/07/2019", "15/07/2019", "18/07/2019"].sample,
  end_date: ["24/07/2019", "26/07/2019", "28/07/2019"].sample,
  steps: [
    {
      nights: [1, 2, 3, 4].sample,
      location: "Amsterdam",
      longtitude: 45.33333,
      latitude: 32.2222,
      address: "test",
      activities: [
        {
          category: ["Sleep", "See", "Eat", "Drink", "Comment", "Move"].sample,
          name: "film hallen",
          longtitude: 45.33333,
          latitude: 32.2222,
          address: "test",
          comment: "Insert nice comment here",
          description: "Insert description of activity here"
        },
        {
          category: ["Sleep", "See", "Eat", "Drink", "Comment", "Move"].sample,
          name: "Bitter ballen",
          longtitude: 45.33333,
          latitude: 32.2222,
          address: "test",
          comment: "Insert nice comment here",
          description: "Insert description of activity here"
        }
      ]
    }
  ]
}]


puts trips

# 5.times do
#   trip = Trip.new(
#     name: Faker::Lorem.word,
#     user_id: User.sample.id,
#     start_date: ["13/07/2019", "15/07/2019", "18/07/2019"].sample
#     end_date: ["24/07/2019", "26/07/2019", "28/07/2019"].sample
#     )
#   trip.save!




#   3.times do
#     step = Step.new(
#       trip_id: trip.id,
#       nights: [1, 2, 3, 4].sample,
#       location:
#       longtitude:
#       latitude:
#       address:
#     )
#     step.save!
#     end

#       2.times do
#         activity = Activity.new(
#           category: ["Sleep", "See", "Eat", "Drink", "Comment", "Move"].sample
#           name:
#           longtitude:
#           latitude:
#           address:
#           comment: "Insert nice comment here",
#           description: "Insert description of activity here"
#           )
#         activity.save!
#       end

# end


#  5.times do
#   trip = Trip.new(
#     name: Faker::Lorem.word,
#     user_id: User.where(username: "cdafonseca").id,
#     start_date: ["13/07/2019", "15/07/2019", "18/07/2019"].sample
#     end_date: ["24/07/2019", "26/07/2019", "28/07/2019"].sample
#     )
#   trip.save!


  puts 'seeds created'
