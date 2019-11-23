
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



rvisser = User.new(
  username: 'rvisser',
  email: 'rvisser@gmail.com',
  password: '12345678',
  password_confirmation: '12345678',
  first_name: "Richard",
  last_name: "Visser",
  home_city: "Amsterdam"
)

users = [cdafonseca.save, rvisser.save]


trips = [
{
  name: "Exploring the Netherlands",
  user_id: 1,
  start_date: ["13/07/2019", "15/07/2019", "18/07/2019",].sample,
  end_date: ["24/07/2019", "26/07/2019", "28/07/2019"].sample,
  published: true,
  country: 'Netherlands',
  country_code: 'NL',
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
  name: "Tour of Italy",
  user_id: 2,
  start_date: ["13/07/2019", "15/07/2019", "18/07/2019"].sample,
  end_date: ["24/07/2019", "26/07/2019", "28/07/2019"].sample,
  published: false,
  country: 'Italy',
  country_code: 'IT',
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

{
  name: "Skiing the French Alps",
  user_id: 1,
  start_date: ["13/12/2019", "15/12/2019", "18/12/2019",].sample,
  end_date: ["24/12/2019", "26/12/2019", "28/12/2019"].sample,
  published: true,
  country: 'France',
  country_code:'FR',
  steps: [
    {
      nights: [1, 2, 3, 4].sample,
      location: "France",
      longitude: 52.371894,
      latitude: 4.900755,
      address: "Morzine, France",
      position: 1,
      activities: [
        {
          category: "See",
          name: "Avoriaz",
          longitude: 6.776600,
          latitude: 46.191250,
          address: "44 Prom. Du Festival Morzine, France",
          comment: "Beautiful mountain with great conditions for skiing!",
          description: "Ski resort",
          position: 1
        },
        {
          category: "Sleep"
          name: "Hôtel des Dromonts",
          longitude: 6.776700,
          latitude: 46.189220,
          address: ' 40 Place Des Dromonts, Avoriaz, France',
          comment: "4 star hotel but felt like 5 stars! Would stay here again!",
          description: "Ski Resort Hotel",
          position: 2
        },
        {
          category: "Eat"
          name: "Le Petit Lindaret",
          longitude: 6.773520,
          latitude: 46.210180,
          address: "4863 Route des Lindarets Montriond, France",
          comment: "Super fromage!",
          description: "Modern European Cuisine",
          position: 3
        }
      ]
    }
  ]
},

{
  name: "Rwanda Gorilla Trekking Safari",
  user_id: 2 ,
  start_date: ["13/05/2020", "15/05/2020", "18/05/2020",].sample,
  end_date: ["24/05/2020", "26/05/2020", "28/05/2020"].sample,
  published: true,
  country: 'Rwanda',
  country_code: 'RW',
  steps: [
    {
      nights: [1, 2, 3, 4].sample,
      location: "Ruhengeri",
      longitude: 52.371894,
      latitude: 4.900755,
      address: "Ruhengeri, Rwanda",
      position: 1,
      activities: [
        {
          category: "Sleep",
          name: "Mountain Gorilla View Lodge",
          longitude: 29.587690,
          latitude: -1.446210,
          address: "Kinigi Virunga Mountains, Kinigi Rwanda",
          comment: "Wonderful staff, beautiful view of the mountains!",
          description: "Hotel",
          position: 1
        },
        {
          category: "See",
          name: "Rwanda Gorilla Tours",
          longitude: 29.534367,
          latitude: -1.540668,
          address: 'Mukingo, Rwanda',
          comment: "Once in a lifetime experience",
          description: "Guided tour through the jungle",
          position: 2
        },
        {
          category: "Drink",
          name: "Sous Le Soleil Bar Brasserie",
          longitude: 29.271003,
          latitude: -1.783669,
          address: "Kigufi, Rwanda",
          comment: "What an amazing experience",
          description: "Lovely drinks",
          position: 3
        }
      ]
    }
  ]
},

{
  name: "Durban",
  user_id: 1,
  start_date: ["13/07/2019", "15/07/2019", "18/07/2019",].sample,
  end_date: ["24/07/2019", "26/07/2019", "28/07/2019"].sample,
  published: true,
  country: 'South Africa',
  country_code: 'ZA',
  steps: [
    {
      nights: [1, 2, 3, 4].sample,
      location: "Durban",
      longitude: 31.021839,
      latitude: -29.858681,
      address: "Durban, South Africa",
      position: 1,
      activities: [
        {
          category: "Eat",
          name: "The Chef's Table",
          longitude: 52.375454,
          latitude: 4.884245,
          address: "1 Chartwell Dr, Umhlanga, South Africa",
          comment: "Absolutely amazing restaurant.  Best wine list, best food and the most wonderful people. Thanks for brilliant experience.  We will be back again and again and again.",
          description: "Fine dining restaurant",
          position: 1
        },
        {
          category: "See",
          name: "uShaka Marine World",
          longitude: 30.776060,
          latitude: -27.040960,
          address: 'King Shaka Ave, Durban, South Africa',
          comment: "So many dolphins!!",
          description: "Marine Theme Park",
          position: 2
        },
        {
          category: "See",
          name: "Toyota Motor Manufacturing South Africa",
          longitude: 30.931390,
          latitude: -29.977860,
          address: "2F Prospecton Rd, Prospecton, South Africa",
          comment: "Wonderful and informative tour of a manufacturing plant",
          description: "Factory Tour",
          position: 3
        }
      ]
    }
  ]
},

]

# users.each do |user|
#   newuser = User.create!(
#     username: user[:username],
#     email: user[:email],
#     password: user[:password],
#     password_confirmation: user[:password_confirmation],
#     first_name: user[:first_name],
#     last_name: user[:last_name],
#     home_city: user[:home_city]
#   )
# end


trips.each do |trip|
  p "Creating trips"

      newtrip = Trip.create!(
        user_id: trip[:user_id],
        name: trip[:name],
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
        address: step[:address],
        position: step[:position]
      )

      step[:activities].each do | activity |
        newactivity = Activity.create!(
            step_id: newstep.id,
            category: activity[:category],
            name: activity[:name],
            longitude: activity[:longitude],
            latitude: activity[:latitude],
            address: activity[:address],
            position: activity[:position],
            comment: "Insert nice comment here",
            description: "Insert description of activity here"
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
