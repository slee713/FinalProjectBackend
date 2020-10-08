# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

hiking_trip = HikingTrip.create(name: "Wonderland 2019", start_date: "2020-08-08", end_date: "2020-08-16", description: "This is wonderland trip 2019", hiking_project_id: 7002125 )

user = User.first

steven_userHike = UserHike.create(user: user, hiking_trip: hiking_trip)

phil = User.create(username: "philaram", password: "philaram", email: "phil@gmail.com", first_name: "Phil", last_name: "Aram")

faye = User.create(username: 'faye', password: 'faye', email: 'faye@email.com', first_name: 'Faye', last_name: 'Kim')

phil_userhike = UserHike.create(user: phil, hiking_trip: hiking_trip)
faye_userhike = UserHike.create(user: faye, hiking_trip: hiking_trip)

Stop.create(hiking_trip: hiking_trip, stop: 1, name: "Dick Creek", elevation: 5570, distance: 9.8, notes: "day 1")
Stop.create(hiking_trip: hiking_trip, stop: 2, name: "Golden Lakes", elevation: 5130, distance: 12.2, notes: "day 2")
Stop.create(hiking_trip: hiking_trip, stop: 3, name: "Pyramid Creek", elevation: 3765, distance: 11.5, notes: "day 3")
Stop.create(hiking_trip: hiking_trip, stop: 4, name: "Maple Creek", elevation: 3805, distance: 7.3, notes: "day 4")
Stop.create(hiking_trip: hiking_trip, stop: 5, name: "Indian Bar", elevation: 3385, distance: 9.9, notes: "day 5")
Stop.create(hiking_trip: hiking_trip, stop: 6, name: "Summerland", elevation: 5940, distance: 11.3, notes: "day 6")
Stop.create(hiking_trip: hiking_trip, stop: 7, name: "Sunrise", elevation: 6245, distance: 8.6, notes: "day 7")


GroupGearItem.create(user_hike_id: steven_userHike.id,  name: "Tent", qty: 1, notes: "2 Person Tent For the Girls")
GroupGearItem.create(user_hike_id: steven_userHike.id,  name: "Stove", qty: 1, notes: "Bringing stove for group")
GroupGearItem.create(user_hike_id: phil_userhike.id,  name: "Tent", qty: 1, notes: "3 person Tent for the Boys")
GroupGearItem.create(user_hike_id: faye_userhike.id,  name: "Stove", qty: 1, notes: "Bringing another stove")
GroupGearItem.create(user_hike_id: faye_userhike.id,  name: "Gas", qty: 2, notes: "bringin 2 canisters for the trip")

PersonalGearItem.create(user: user, name: "Backpack", qty: 1, notes: "Seek Outisde 55L w/accessories")
PersonalGearItem.create(user: user, name: "Sleeping Bag", qty: 1, notes: "Kelty 20 Degree")
PersonalGearItem.create(user: user, name: "Trekking Poles", qty: 1)
PersonalGearItem.create(user: user, name: "Stove", qty: 1, notes: "Snow Peak Portable Stove")
PersonalGearItem.create(user: user, name: "Tent", qty: 1, notes: "Nemo 2p")
PersonalGearItem.create(user: user, name: "Shoes", qty: 2, notes: "Altra Lone Peak and Saucony Iso Trail Runners")
PersonalGearItem.create(user: user, name: "Insulation Layer", qty: 1, notes: "Arcteryx " )

PersonalGearItem.create(user: phil, name: "Backpack", qty: 1, notes: "Arcteryx 55L")
PersonalGearItem.create(user: phil, name: "Stove", qty:1, notes: "Snow Peak")
PersonalGearItem.create(user: phil, name: "Trekking Poles", qty: 1, notes:'Black Diamond')
PersonalGearItem.create(user: phil, name: "First Aid Kit", qty: 1, notes: '')
PersonalGearItem.create(user: phil, name: "Sleeping Pad", qty: 1, notes: 'Nemo insulated pad')


PersonalGearItem.create(user: faye, name: "Trekking Poles", qty: 1, notes:'Black Diamond')
PersonalGearItem.create(user: faye, name: "First Aid Kit", qty: 1, notes: '')
PersonalGearItem.create(user: faye, name: "Sleeping Pad", qty: 1, notes: 'Nemo insulated pad')

FoodPlan.create(user_hike_id: steven_userHike.id, day: "2020-08-08", breakfast: "oatmeal", lunch: "MH Chili", dinner: "Skurka Beans and Rice", snacks: "Beef Jerky and M&M")
FoodPlan.create(user_hike_id: steven_userHike.id, day: "2020-08-09", breakfast: "oatmeal", lunch: "MH Beef Bolognese", dinner: "Torilla Soup", snacks: "CLiff Bars")
FoodPlan.create(user_hike_id: steven_userHike.id, day: "2020-08-10", breakfast: "oatmeal", lunch: "MH Chicken Salad", dinner: "Black bean Salad", snacks: "Beef Jerky and M&M")
FoodPlan.create(user_hike_id: steven_userHike.id, day: "2020-08-11", breakfast: "oatmeal", lunch: "Cottage Pie", dinner: "Cajun Chicken Salad", snacks: "Cliff Bars")
FoodPlan.create(user_hike_id: steven_userHike.id, day: "2020-08-12", breakfast: "oatmeal", lunch: "Skurka Beans", dinner: "Puttanesca", snacks: "Beef Jerky and M&M")


FoodPlan.create(user_hike_id: phil_userhike.id, day: "2020-08-08", breakfast: 'oatmeal', lunch: 'chicken and dumplings', dinner: 'Corn Chowder', snacks:'fruit roll up and pretzel')
FoodPlan.create(user_hike_id: phil_userhike.id, day: "2020-08-09", breakfast: 'oatmeal', lunch: 'Cottage Pie', dinner: 'Corn Chowder', snacks:'fruit roll up and pretzel')
FoodPlan.create(user_hike_id: phil_userhike.id, day: "2020-08-010", breakfast: 'oatmeal', lunch: 'Chicken Salad', dinner: 'Corn Chowder', snacks:'fruit roll up and pretzel')


Friendship.create(user_id: user.id, friend_id: phil.id)
Friendship.create(user_id: phil.id, friend_id: user.id)
Friendship.create(user_id: user.id, friend_id: faye.id)
Friendship.create(user_id: faye.id, friend_id: user.id)
