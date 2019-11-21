
puts 'creating seeds'
User.destroy_all
Trip.destroy_all
Step.destroy_all
Activity.destroy_all

cdafonseca = User.new(
  username: 'cdafonseca',
  email: 'dafonseca.ca@gmail.com',
  password: '12345678',
  password_confirmation: '12345678',
  first_name: "Caroline",
  last_name: "Da Fonseca",
  home_city: "Amsterdam"
)

cdafonseca.save

rvisser = User.new(
  username: 'rvisser',
  email: 'rvisser@gmail.com',
  password: '12345678',
  password_confirmation: '12345678',
  first_name: "Richard",
  last_name: "Visser",
  home_city: "Amsterdam"
)

rvisser.save



trips = [
{
  name: "Netherlands",
  user_id: 1,
  start_date: ["13/07/2019", "15/07/2019", "18/07/2019"].sample,
  end_date: ["24/07/2019", "26/07/2019", "28/07/2019"].sample,
  published: true,
  steps: [
    {
      nights: [1, 2, 3, 4].sample,
      location: "Amsterdam",
      longitude: 52.371894,
      latitude: 4.900755,
      address: "Amsterdam, The Netherlands",
      position: 1,
      activities: [
        {
          category: ["Sleep", "See", "Eat", "Drink", "Comment", "Move"].sample,
          name: "Anne Frank Huis",
          longitude: 52.375454,
          latitude: 4.884245,
          address: "Westermarkt 20, Amsterdam",
          comment: "Lines of people, lines of people everywhere",
          description: "Insert description of activity here",
          position: 1
        },
        {
          category: ["Sleep", "See", "Eat", "Drink", "Comment", "Move"].sample,
          name: "Katsu",
          longitude: 52.372995,
          latitude: 4.883347,
          address: 'Eerste van der Helststraat 70, 1072 NZ Amsterdam',
          comment: "What an amazing experience",
          description: "Insert description of activity here",
          position: 2
        },
        {
          category: ["Sleep", "See", "Eat", "Drink", "Comment", "Move"].sample,
          name: "Royal Palace Amsterdam",
          longitude: 52.373446,
          latitude: 4.891880,
          address: "Nieuwezijds Voorburgwal 147, 1012 RJ Amsterdam",
          comment: "What an amazing experience",
          description: "Insert description of activity here",
          position: 3
        }
      ]
    }
  ]
},
{
  name: "Italy",
  user_id: 1,
  start_date: ["13/07/2019", "15/07/2019", "18/07/2019"].sample,
  end_date: ["24/07/2019", "26/07/2019", "28/07/2019"].sample,
  published: false,
  steps: [
    {
      nights: [1, 2, 3, 4].sample,
      location: "Rome",
      longitude: 41.898116,
      latitude: 12.504502,
      address: "Rome, Italy",
      position: 1,
      activities: [
        {
          category: ["Sleep", "See", "Eat", "Drink", "Comment", "Move"].sample,
          name: "Colosaeo",
          longitude: 41.890330,
          latitude: 12.492177,
          address: "Piazza del Colosseo, 1, 00184 Rome",
          comment: "What a beauty",
          description: "Insert description of activity here",
          position: 1
        },
        {
          category: ["Sleep", "See", "Eat", "Drink", "Comment", "Move"].sample,
          name: "Gelateria La Romana",
          longitude: 41.908574,
          latitude: 12.499100,
          address: "Via Cola di Rienzo, 2, 00193 Roma RM, Italy",
          comment: "Insert nice comment here",
          description: "Insert description of activity here",
          position: 2
        }
      ]
    },
    {
      nights: [1, 2, 3, 4].sample,
      location: "Firenze",
      longitude: 43.778024,
      latitude: 11.272040,
      address: "Florence, Italy",
      position: 2,
      activities: [
        {
          category: ["Sleep", "See", "Eat", "Drink", "Comment", "Move"].sample,
          name: "St Trinity Bridge",
          longitude: 43.769318,
          latitude: 11.250419,
          address: "Ponte Santa Trinita",
          comment: "What a beauty",
          description: "Ponte Santa Trinita, 50100 Firenze FI, Italy",
          position: 1
        }
      ]
    }
  ]
}
]



trips.each do |trip|
  p "Creating trips"

  newtrip = Trip.create!(
    name: trip[:name],
    user: User.all.sample,
    start_date: trip[:start_date],
    end_date: trip[:end_date],
    published: trip[:published]
  )


  trip[:steps].each do |step|
    newstep = Step.create!(
      trip_id: newtrip.id,
      nights: step[:nights],
      location: step[:location],
      longitude: step[:longitude],
      latitude: step[:latitude],
      address: step[:address]
    )

      step[:activities].each do | activity |
        newactivity = Activity.create!(
            step_id: newstep.id,
            category: activity[:category],
            name: activity[:name],
            longitude: activity[:longitude],
            latitude: activity[:latitude],
            address: activity[:address],
            comment: "Insert nice comment here",
            description: "Insert description of activity here",
        )
      end
  end

end

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
#       longitude:
#       latitude:
#       address:
#     )
#     step.save!
#     end

#       2.times do
#         activity = Activity.new(
#           category: ["Sleep", "See", "Eat", "Drink", "Comment", "Move"].sample
#           name:
#           longitude:
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
