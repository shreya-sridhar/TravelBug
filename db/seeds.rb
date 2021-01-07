# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

User.destroy_all 
Destination.destroy_all
Trip.destroy_all
Activity.destroy_all
Food.destroy_all
DestinationActivity.destroy_all
DestinationFood.destroy_all

csv_text = File.read(Rails.root.join('lib', 'seeds', 'country_map.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
    t = Destination.new
    t.location = row['location']
    t.country = row['country']
    t.save
end


u1 = User.create(name: "Tim", age: 20, hometown: "Alabama")
u2 = User.create(name: "Alice", age: 19, hometown: "Miami")
u3 = User.create(name: "Beth", age: 35, hometown: "Dallas")
u4 = User.create(name: "John", age: 54, hometown: "Los Angeles")

d1 = Destination.create(location: "Hawaii",country: "United States" , description: "beaches all around" ,image:"https://img1.10bestmedia.com/Images/Photos/374469/GettyImages-1038532990_54_990x660.jpg")
d2 = Destination.create(location: "Cairo",country:"Egypt" , description:"ancient civilizations" ,image:"https://rvca738f6h5tbwmj3mxylox3-wpengine.netdna-ssl.com/wp-content/uploads/2018/09/GI_815359526_CitadelView_Cairo.jpg")
d3 = Destination.create(location: "Las Vegas",country: "United States" , description: "city that never sleeps" ,image:"https://www.telegraph.co.uk/content/dam/Travel/2020/May/las-vegas-strip-istock.jpg?imwidth=1400")
d4 = Destination.create(location: "Berlin" ,country: "Germany", description: "deep history",image:"https://upload.wikimedia.org/wikipedia/commons/6/6c/Aerial_view_of_Berlin_%2832881394137%29.jpg")

t1 = Trip.create(start_date: 2021-01-20, end_date: 2021-02-14, num_of_people:2 , traveller_names:"Pam", user_id: u1.id, destination_id:d1.id)
t2 = Trip.create(start_date: 2021-02-14, end_date: 2021-03-25, num_of_people: 4 , traveller_names:"Alex,Dan,Bob", user_id:u4.id, destination_id:d3.id)
t3 = Trip.create(start_date: 2021-03-25, end_date: 2021-04-06, num_of_people: 5 , traveller_names:"April,Jenny,Hope,Lisa", user_id: u2.id, destination_id:d2.id)

a1 = Activity.create(name: "Skydiving" ,description: "explore the skies", image: "https://skydivesantabarbara.com/wp-content/uploads/2019/04/Skydive_Santa_Barbara_Tandem_Skydiving.jpg", category:"adventure",price: 200 )
a2 = Activity.create(name: "Surfing" ,description: "hit the ocean", image:"https://www.outsideonline.com/sites/default/files/styles/full-page/public/2019/05/23/woman-surfing-wave_h.jpg?itok=XmjJhGlT", category:"outdoors",price:80)
a3 = Activity.create(name: "Casino",description:"Make or lose money", image:"https://img1.10bestmedia.com/Images/Photos/381459/Firekeepers-Casino-Hotel_54_990x660.jpg", category:"gambling",price: 50)

f1 = Food.create(cuisine: "Italian" ,restaurant_name: "Mario's",dish: "Carbonara",image:"https://www.gimmesomeoven.com/wp-content/uploads/2013/10/Pasta-Carbonara-Recipe-1.jpg")
f2 = Food.create(cuisine: "Mexican",restaurant_name: "3 Peppers",dish:"quesadillas",image:"https://www.theendlessmeal.com/wp-content/uploads/2020/08/BBQ-Chicken-Quesadillas-3.jpg")
f3 = Food.create(cuisine: "French" ,restaurant_name:"C'est la vie",dish:"Escargot",image:"https://assets.epicurious.com/photos/57a8adfbb10b4fb03f234f37/master/pass/escargots-a-la-bourguignonne.jpg")

da1 = DestinationActivity.create(destination_id: d1.id,activity_id:a2.id)
da2 = DestinationActivity.create(destination_id: d2.id ,activity_id:a1.id)
da3 = DestinationActivity.create(destination_id: d3.id,activity_id:a1.id)
da4 = DestinationActivity.create(destination_id: d3.id,activity_id:a3.id)

df1 = DestinationFood.create(destination_id: d1.id, food_id: f1.id)
df2 = DestinationFood.create(destination_id: d1.id , food_id: f2.id)
df3 = DestinationFood.create(destination_id: d2.id, food_id: f3.id)
df4 = DestinationFood.create(destination_id: d3.id, food_id: [f1.id, f2.id, f3.id])

puts "all done"


