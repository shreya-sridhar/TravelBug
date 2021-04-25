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
  t.country = row['country']
  t.location = row['location']
  t.lat = row['lat']
  t.lon = row['lng']
  t.image = Getdatum.get_photo(t)
  t.save
  puts "done"
end

# d1 = Destination.create(location: "Hawaii",country: "United States" , description: "beaches all around" ,image:"https://img1.10bestmedia.com/Images/Photos/374469/GettyImages-1038532990_54_990x660.jpg")
# d2 = Destination.create(location: "Cairo",country:"Egypt" , description:"ancient civilizations" ,image:"https://rvca738f6h5tbwmj3mxylox3-wpengine.netdna-ssl.com/wp-content/uploads/2018/09/GI_815359526_CitadelView_Cairo.jpg")
# d3 = Destination.create(location: "Las Vegas",country: "United States" , description: "city that never sleeps" ,image:"https://www.telegraph.co.uk/content/dam/Travel/2020/May/las-vegas-strip-istock.jpg?imwidth=1400")
# d4 = Destination.create(location: "Berlin" ,country: "Germany", description: "deep history",image:"https://upload.wikimedia.org/wikipedia/commons/6/6c/Aerial_view_of_Berlin_%2832881394137%29.jpg")


u1 = User.create(name: "Tim", age: 20, hometown: "Alabama")
u2 = User.create(name: "Alice", age: 19, hometown: "Miami")
u3 = User.create(name: "Beth", age: 35, hometown: "Dallas")
u4 = User.create(name: "John", age: 54, hometown: "Los Angeles")

t1 = Trip.create(start_date: 2021-01-20, end_date: 2021-02-14, num_of_people:2 , traveller_names:"Pam", user_id: u1.id, destination_id:Destination.all.sample.id)
t2 = Trip.create(start_date: 2021-02-14, end_date: 2021-03-25, num_of_people: 4 , traveller_names:"Alex,Dan,Bob", user_id:u4.id, destination_id:Destination.all.sample.id)
t3 = Trip.create(start_date: 2021-03-25, end_date: 2021-04-06, num_of_people: 5 , traveller_names:"April,Jenny,Hope,Lisa", user_id: u2.id, destination_id:Destination.all.sample.id)



puts "all done"




