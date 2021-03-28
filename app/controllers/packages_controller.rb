class PackagesController < ApplicationController
    def show 
        if (params[:name] == "Tanzania")
            @title = ["Arrival in Tanzania & Tarangire National Park","Trip To Gibbs Farm & Ngorongoro Crater","Ngorongoro Crater Safari","Trip to Serengeti","Game Drive in Serengeti","Arrival in Lake Manyara","Zanzibar Sightseeing Tour"]
            @body = ["As you arrive in Tanzania, you will be transferred to Tarangire National Park, where you will get to enjoy a game drive through the jungle and spot the predators like Lion, Cheetah, and Leopard.

                Also, you may see elephants and buffaloes roaming freely. In the afternoon, go for another game drive and spot some exotic birds with the help of your tour guide.
                
                In the evening, you will be taken to Tarangire Camp/ Lounge for dinner and an overnight stay.","After having breakfast, head out for a morning game drive into the forest.

                Later, you will be heading to Gibbs Farm where you will get to enjoy the refreshing fruits and fresh breeze running through your head.
                
                In the afternoon, enjoy a farmhouse lunch at Gibbs Farm and continue your trip to Ngorongoro Crater.
                
                As you reach, check-in at the lodge, have dinner and an overnight stay in Ngorongoro.","After having breakfast, get ready for a safari of Ngorongoro Crater, the world’s largest intact caldera and a UNESCO world heritage site.

                Today you will enjoy a 2000 feet descent into the crater for a full day safari in a 4 wheel drive.
                
                It is a natural wonder of the world as it hosts the largest annual animal migration. This forest bowl is a home to more than 30,000 animals including the wildebeest, elephant, lion, dik-dik, and warthog. You will also spot some pelican, ibis, and flamingo on your drive.
                
                After the drive, head back to the lodge for dinner and an overnight stay.","After having a hearty breakfast, check-out from the lodge and start your journey to Serengeti.

                The Serengeti is a vast ecosystem in east central africa which houses the highest concentration of large mammals in the world. Here you will find giraffes, elephants, hippos and lions.
                
                It is a home to more than 500 species of birds, including ostriches and flamingos.
                
                As you reach, check-in at Serengeti lodge, have dinner and an overnight stay.","After having a wholesome breakfast, set out for a game drive through this magnificent forest and witness the animal kingdom in its prime. Here you may spot the big Five; lion, leopard, buffalo, elephant, and rhino.

                As you drive through, witness huge herds of zebra and wildebeest grazing freely and running around.
                
                After the drive, head back to the lodge for dinner and an overnight stay.","After having a toothsome breakfast, check-out from the lodge and start driving to Lake Manyara.

                In the afternoon, go for a game drive and see large groups of animals and birds roaming around the lake.
                
                Here you will get to see flamingos, elephants, wildebeest, baboon, giraffes, buffalos, Cape clawless otter, cheetahs, Egyptian mongoose, hippos, impalas, leopards, lions, short-eared galagos, warthogs and wildebeest.
                
                Here you will see thousands of flamingos roaming around the waterside.
                
                After the drive, get transferred to the lodge for Dinner and an overnight stay.","After having a leisurely breakfast, you can head out to explore the city on your own.

                You can head out for a sightseeing tour and explore the beautiful beaches of Zanzibar.
                
                Indulge in various activities like snorkeling, swimming and get sun-tanned.
                
                Later, you can proceed to visit Stone town, Nungwi, and Kendwa beaches, Mnemba Atoll, and watch the Giant Turtles on Prison Island.
                
                Changuu island is also known as Prison island or Quarantine island due to its history. In 1893, Lloyd Mattews, the british first minister of Zanzibar constructed a prison on this island and later it was used as a quarantine center for yellow fever cases.
                
                As the day ends, head back to the hotel for an overnight stay."]
            url = "https://pixabay.com/api/?key=20881751-dd7fb42383b27ec4a1d57dca8&q=Tanzania&image_type=photo&pretty=true&page=1&per_page=3"
            url = "https://pixabay.com/api/?key=20881751-dd7fb42383b27ec4a1d57dca8&q=Tanzania&image_type=photo&pretty=true&page=1&per_page=3"
            uri = URI.parse(url)
            response = Net::HTTP.get_response(uri)
            response.body
            # @image1 = JSON.parse(response.body)["hits"][0]["largeImageURL"]
            # @image2 = JSON.parse(response.body)["hits"][1]["largeImageURL"]
            # @image3 = JSON.parse(response.body)["hits"][2]["largeImageURL"]
            @package = "Tanzania"
        elsif (params[:name] == "Europe")
            @title = ["Paris (France)","Paris – Guided City Orientation Tour - Eiffel Tower visit 2nd Level - River Seine Cruise","Paris – Zurich (Switzerland)"," Zurich - Mt. Titlis, Ice Flyer, snow park and Lucerne Orientation - Zurich","Zurich - Excursion to Jungfrau - Top of Europe/Interlaken - Zurich","Zurich –Rhine Falls - Vaduz (Liechtenstein) – Wattens - Innsbruck (Austria)"," Innsbruck – Venice Mestre/Padova (Italy)","Venice (Airport)"]
            @body = ["Arrival in Paris.

                Leisure day. See the city on your own or relax in your hotels.
                
                Overnight in Paris.
                
                Meals: (Dinner Delivered to Hotel)","Guided Orientation tour of Paris

                See place de la concorde, Arc de Triomphe, Notre Dame de Paris, Louvre Pyramid, Musée d'Orsay, Palais Garnier Opera, Champs Elysees Street, Alexander Bridge, Montmatre & Concords Square
                
                Visit the 2nd floor of the Eiffel Tower for breathtaking views
                
                Cruise on River Seine.
                
                Dinner at restaurant.
                
                Overnight stay at hotel in Paris.
                
                Meals: (Continental Breakfast and  Dinner)","Check out from your hotel after breakfast and start your journey to Zurich as per Europe tour package for family.

                After arrival, enjoy an  dinner and retire for the night.
                
                Overnight at Zurich hotel.
                
                Meals: (Breakfast and  Dinner)","Have your breakfast and proceed to Engelberg town.

                Visit mt. Titlis starting from this town in a cable car included in Europe tour package for family.
                
                You can also visit the Swiss Lion Shop which is the world's highest watch shop.
                
                Click photos in authentic Swiss costume at a studio
                
                Enjoy your time at Mt Titlis.
                
                Later in the afternoon, go for Lucerne guided tour.
                
                Visit Chapel Bridge, Jesuit church, Lion Monument etc.
                
                Proceed back to Zurich and spend your night at the Zurich hotel.
                
                Meals: (Breakfast and  Dinner)","After breakfast, go for an optional tour to Mt. Jungfrau or explore Interlaken on your own.

                Visit the highest railway station of Europe located at 3454m height.
                
                Later, go for an Interlaken city tour.
                
                Start from Hoheweg which is the main street in Interlaken.
                
                Visit Roman Catholic Church which has workshop masses having a unique experience.
                
                Proceed back to the Zurich hotel.
                
                Meals: (Continental Breakfast and  Dinner)","Have your breakfast and check out from hotel

                Board your coach to Innsbruck
                
                On your way, make a stop at Rhine Falls- which is the biggest waterfalls in Europe
                
                You take a quick stop at Vaduz and explore the city for some time
                
                Later, get back on your way to Innsbruck
                
                Visit Swarvoski Museum and witness a great collection of world famous crystals
                
                Witness Chetak: the horse of Maharana Pratap ornamented with Swarovski jewels.
                
                Get on a guided introductory city tour in Innsbruck.
                
                Visit Golden Dachl, Imperial Palace, River Inns, the Golden Roof, Royal Church etc.
                
                Later, have dinner at an  restaurant and retire for the night at Innsbruck hotel
                
                Meals: (Breakfast and  Dinner)","Have breakfast and check out from your hotel.

                Board your coach and start your journey towards Venice.
                
                After arrival, enjoy a guided city tour.
                
                Embark on Vaparetto ride taking you to Venice island
                
                Explore the city with boat rides
                
                Visit San Mark's Square, the Basilica, The Doge's Palace, Bell Tower, St. Mark Cathedral etc
                
                Later, have dinner at an  restaurant and check into your hotel.
                
                Meals: (Breakfast and  Dinner)","Your holiday ends here.

                Fly back home.
                
                Leave with wonderful memories as Europe tour package for family ends here."]
            url = "https://pixabay.com/api/?key=20881751-dd7fb42383b27ec4a1d57dca8&q=Europe&image_type=photo&pretty=true&page=1&per_page=3"
            url = "https://pixabay.com/api/?key=20881751-dd7fb42383b27ec4a1d57dca8&q=Europe&image_type=photo&pretty=true&page=1&per_page=3"
            uri = URI.parse(url)
            response = Net::HTTP.get_response(uri)
            response.body
            @image1 = JSON.parse(response.body)["hits"][0]["largeImageURL"]
            @image2 = JSON.parse(response.body)["hits"][1]["largeImageURL"]
            @image3 = JSON.parse(response.body)["hits"][2]["largeImageURL"]
            @package = "Europe"
        elsif (params[:name] == "London & Edinburgh")
            @title = ["Arrival in London","London HOHO Tour","A Day at Leisure","London to Edinburgh Transfers","Leisure Day | Optional Excursions"," Edinburgh HOHO Tour","Departure"]
            @body = ["As you arrive at London Heathrow Airport, our representative will welcome you and escort you to the pre-booked hotel for your stay.

                Check-in at the hotel and get rid of your travel fatigue.
                
                Later, you can go out and explore the city with a HOHO tour, your pass is valid for 48 hours. Board the bus and visit all the famous attractions as per your comfort.
                
                After the visit, proceed to London’s Eye, an observation ferris wheel. From here, you can enjoy the panoramic views of this elegant capital.
                
                Return to the hotel for an overnight stay.","After having a delicious breakfast, head out to resume your HOHO tour to explore the city.

                You can explore different routes and later, head to Madame Tussauds, where you will witness realistic wax statues of famous personalities of the world, along with other interactive attractions.
                
                After the tour, spend your evening strolling through the famous streets of London and get back to the hotel for an overnight stay.","After having a full fledged English Breakfast, spend the rest of the day on your own.

                You can relax all day at the hotel or you can go out to explore the city as per your comfort.
                
                Visit the favourite spots of the localities, such as the popular pubs, bars or you can choose from some of optional excursions such as trip to Warner Bros Studio, Stonehenge and Bath Day Trip and trip to Harry potter land.
                
                In the evening, you can go to Oxford street for a shopping spree and enjoy some local delicacies at the eateries.
                
                Return to the hotel for an overnight stay.","After having a wholesome breakfast, check-out from the hotel and head to London Train Station to board a train to Edinburgh.

                As you reach, our representative will welcome you in a scottish manner and assist you to the hotel for your stay.
                
                Check-in at the hotel and spend the rest of the day relaxing in your room.
                
                In the evening, you can head out to explore nearby places.
                
                Have an overnight stay at the hotel.","Start your day with a scottish breakfast and then you can choose from the optional excursion to explore the legendary loch ness monster.

                You can take a trip to Loch Lomond, Kelpies & Stirling Castle Tour, where you will get to see Kelpies Monument, Loch Lomond, and Sterling Castle.
                
                Or you can book the Loch Ness, Glencoe & The Highlands Tour to learn about the mysterious Loch Ness monster and enjoy the scenic beauty of Glencoe and the Highlands!
                
                After the tour, return to the hotel for an overnight stay.","After having a toothsome breakfast, get ready to explore the best of Edinburgh with a HOHO tour.

                Board a bus and visit all the major tourist attractions such as the Scottish National Gallery, Edinburgh Castle, the Scottish Parliament and Edinburgh's Old Town.
                
                Next , you will be exploring the New Town of Georgian.After the tour, board a bus and visit the Royal Mile, Palace of Holyrood house and the mighty Edinburgh Castle.
                
                As the tour ends, you can savour some scottish delights at the local restaurants and later, head back to the hotel for an overnight stay.","After having breakfast, check-out from the hotel and get dropped off at the airport for your return flight back home with a bagful of wonderful memories."]
            url = "https://pixabay.com/api/?key=20881751-dd7fb42383b27ec4a1d57dca8&q=London&image_type=photo&pretty=true&page=1&per_page=3"
            uri = URI.parse(url)
            response = Net::HTTP.get_response(uri)
            response.body
            @image1 = JSON.parse(response.body)["hits"][0]["largeImageURL"]
            @image2 = JSON.parse(response.body)["hits"][1]["largeImageURL"]
            @image3 = JSON.parse(response.body)["hits"][2]["largeImageURL"]
            @package = "London & Edinburgh"
    elsif (params[:name] == "Australia")
        @title = ["Arrival at Sydney Airport"," City and Bondi Tour","Trip to the Blue Mountains","Arrival at Gold Coast Airport","Visit the Movie World","Sea World"," Arrival at Melbourne","Philip Island Ultimate Eco Tour","Great Ocean Road & Rainforest","Departure to hometown"]
        @body = ["Your journey with us begins as soon as you step in the soils of Sydney.

            Once you meet us, we will transfer you to your preferred accommodation as included in Australia package from Mumbai.
            
            After completing all essential formalities, you may rest for the day as there’s nothing scheduled on day 1.","Enjoy your breakfast and gather at the reception by 08:00 am sharp.

            Your tour starts now.
            
            You will be first exploring the city of Sydney and Bondi river.
            
            What do you have at City and Bondi tour?
            
            This tour allows you to explore the rich colonial history of Sydney.
            
            Attractions – Sydney Opera House, Hyde Park, St. Mary’s Cathedral, Royal Botanical Garden, and so on.
            
            After your City and Bondi tour, its now time to head for The Rocks Walking tour.
            
            What do we have at Rocks Walking tour?
            
            Indulge in the historical significance of Sydney through this Rocks Walking tour.
            
            Attractions – Sydney Harbour Bridge, Sydney Opera House, Cadman’s Cottage, and Campbell’s Cove.
            
            Final closure for the day will be your visit to the Kings Street Wharf, which is a famous food lovers paradise. There are many internationally renowned restaurants to try here.
            
            By 11:45 pm, you will be back to your hotel room.","After your breakfast, you will be heading in the direction of Blue Mountains.

            There at the Blue Mountains, you have ample time to explore the local wildlife at Wildlife Sanctuary Park.
            
            Towards the day closure, you will be heading for a cruising adventure and a visit to the Darling Harbour.
            
            Finally, by 06:30 pm, you will be back to your hotel room.","After your morning breakfast, you will have to check-out from your Sydney hotel.

            As per the Australia package from Mumbai, you will shortly be transferred to the Sydney airport from when you will be flying to Gold Coast.
            
            Upon your arrival at the Gold Coast, you will head towards your hotel and relax for the day.","Your day 5 begins with a heavy breakfast.

            Next, you will be heading in the direction of Movie World.
            
            What do you have at the Movie World?
            
            This is a theme park of Gold Coast featuring around 28 attractions.
            
            Attractions – DC Rivals Hypercoaster, Doomsday Destroyer, Green Lantern Coaster, Batwing Spaceshot, are some of them.
            
            By 05:00 pm, you will be leaving for your hotel and relax for the day.","Your day 6 begins with breakfast.

            After that, you will be heading in the direction of Sea World.
            
            What do you have at Sea World?
            
            Sea World is a marine park with some really amazing adventures.
            
            Attractions – Thunder Lake Stunt Show, PAW Patrol, Goes on Holiday, Penguin Feeding Experience, Ray Reef Experience, Turtle Power Live Show, and so on.
            
            By 05:00 pm, you will be marching in the direction of your hotel room.","Day 7 begins with a breakfast and check-out from your Gold Coast hotel.

            You will then be transferred to Gold Coast Airport to take a flight to Melbourne.
            
            Once you land in Melbourne, you will be transferred to your stay place where you can relax for the remaining length of the day.
            
            In the evening, you will be heading for a Hop On Hop Off tour.
            
            What do you have at Hop On Hop Off tour?
            
            Hop On Hop Off tour is an open-top city sightseeing bus. Here, you have an opportunity to explore around 15 destinations in and around Melbourne.","Your day 8 begins sharply at 10:00 am. By then, you should be done with your breakfast.

            After that, you will be heading for Philip Island Ultimate Eco Tour.
            
            What do you have at Philip Island Ultimate Eco Tour?
            
            Philip Ultimate Eco Tour introduces you both with the nature and wildlife of Melbourne.
            
            Attractions – Moonlight Sanctuary, Philip Island, Churchill Island, and Nobbies Centre.
            
            Finally, by 10:00 pm, you shall be returning back to your hotel room.","Your day 9 begins with a heavy breakfast.

            Sharp at 07:30 am, you will be heading for your visit to Great Ocean Road & Rainforest.
            
            What do you have at Great Ocean Road & Rainforest?
            
            Great Ocean Road portrays a stunning and iconic coastline to adore. There are around 12 apostles, wild koalas, and stunning beaches for you to explore here.
            
            Finally, by 09:00 pm, you will be back to your hotel room as per the Australia package from Mumbai.","Have your breakfast in the morning and complete all the essential checking-out formalities.

            After that, you will be transferred to Melbourne Airport for your onward journey to your hometown."]
        url = "https://pixabay.com/api/?key=20881751-dd7fb42383b27ec4a1d57dca8&q=Australia&image_type=photo&pretty=true&page=1&per_page=3"
        uri = URI.parse(url)
        response = Net::HTTP.get_response(uri)
        response.body
        @image1 = JSON.parse(response.body)["hits"][0]["largeImageURL"]
        @image2 = JSON.parse(response.body)["hits"][1]["largeImageURL"]
        @image3 = JSON.parse(response.body)["hits"][2]["largeImageURL"]
        @package = "Australia"
    elsif (params[:name] == "South Africa")
        @title = [" Arrival in Johannesburg","Trip to Sun- City","Trip to Pilanesberg National Park","Exploring Sun- City","Johannes to Knysna Transfers","Cango Caves Excursion","Trip to Tsitsikamma","Arrival in Cape Town"," Exploring Cape Town","Cape Town City Tour","Leisure Day","Departure"]
        @body = ["Upon your arrival in Johannesburg, you will be greeted by our representative and will be assisted to the hotel for your stay.

            Check-in at the hotel and have some rest.
            
            In the evening, feel free to take a walk in the neighbourhood and relish some delights at local bistros and cafes.
            
            Return to the hotel for an overnight stay.","After having a delicious breakfast, check-out from the hotel and start your journey to Sun City.

            It will take you 3 hours to reach your destination and as you reach, check-in at the hotel and relax.
            
            Spend the evening at the luxurious hotel and re-energize yourself for the next day.
            
            Get back to the hotel for an overnight stay.","After having a wholesome breakfast, embark on a trip to Pilanesberg national park.

            Go for a jungle safari and witness the various species of Mammal in South Africa co-existing in this jungle.
            
            You will also get to see Impala and Springbok, elephant, rhino, lion, buffalo and leopard live alongside giraffe, wild dog, zebra, gnu, myriad antelope species, bat eared foxes and a few more.
            
            You will also see more than 360 species of birds and also enjoy an Elephant Safari.
            
            After the tour, head back to the hotel for an overnight stay.","After having breakfast, set out to explore the Sun- City. Today, you will be visiting some of the major attractions and significant sites.

            You can visit the Palace of the Lost City, the Cascades, the Valley of Waves, and many other places.
            
            In the evening, experience the nightlife of the city, get ready and head to the hottest bars and clubs of the city and have an unforgettable night.
            
            Return to the hotel for an overnight stay.","After having breakfast, check-out from the hotel and get dropped off at the airport to board a flight to George airport.

            After landing, you will be escorted to the hotel for your stay.
            
            Check-in at the hotel and unwind. In the evening, you will be taken for a sunset cruise experience.
            
            Enjoy the panoramic view of the blue lagoons and enjoy dinner with some crispy wine.
            
            Get back to the hotel for an overnight stay.","Enjoy a toothsome breakfast and get ready for an excursion to Cango Caves and Ostrich farms.

            At Ostrich Farm, you will witness ostrich racing and a few more activities.
            
            Next, you will go for a short tour of the Cango Caves, these underground caves were naturally made Calcite.
            
            After the tour, return to the hotel for an overnight stay in Knysna.","After having breakfast, set out for a trip to Tsitsikamma. Today, you will be visiting the Tsitsikamma National Park.

            This park was the first marine national park in Africa. Here, you will find intertidal life, coral reefs and deep-sea fishes along with many other species.
            
            You will also spot some dolphins riding the waves and many more wonderful sights.
            
            Next, you will be visiting Plettenberg Bay, Natures Valley, Bloukrans bridge and Storms River Bridge.
            
            As the tour ends, head back to the hotel for an overnight stay.","After having a hot-piping breakfast, check-out from the hotel and get transferred to Cape Town.

            As you reach, check-in at the hotel and spend the rest of the day leisurely.
            
            In the evening, head to the beautiful beaches of Cape Town and have a wonderful day.
            
            As the stars show up in the sky, get back to the hotel for an overnight stay.","Start your day with a tropical breakfast and prepare yourself for an exciting day in Cape Town.

            Today, you will be visiting the best tourist attractions and famous spots of the city including the Cape Point and the Cape Winelands.
            
            Here you will witness the most jaw-dropping natural landscape with rocky mountain peaks, deep blue oceans and lush green valley.
            
            Next, you will be visiting Cape Winelands, drive along the Atlantic Coast and witness the sights of the cosmopolitan suburb of Sea Point and Camps Bay on your way.
            
            You will also witness the Twelve Apostles, which are part of the Table Mountain range and proceed for a tour of the Cape Point Nature Reserve, where you will see baboons, rhebok, Cape Mountain zebra, bontebok and the elusive eland.
            
            Enjoy bird-watching and see the turtle hatchlings breeding in the habitat.
            
            You will also discover the confluence of the Atlantic and Indian Ocean here.
            
            In the evening, head to the famous Stellenbosch Winelands and enjoy wine tasting.
            
            After the tour, return to the hotel for an overnight stay.","After breakfast, embark on a City tour to explore Cape Town.

            Leap into the culture and vibes of the city and spend your vacation in style.
            
            First we will learn about the history of this old city and visit some of the historical sites.
            
            You will be visiting the Malay Quarter, and witness its colorful little houses. Next visit the city center, the lush Company Gardens and the magnificent Castle of Good Hope.
            
            Later, you will get to enjoy a cable car ride to the top of Table Mountain and after reaching the summit, witness the breath-taking view of the city.
            
            Take a walk in the Milnerton area and see the majestic coastline also called “Nature's Greatest Show”.
            
            After the tour, head back to the hotel for an overnight stay.","After having a lovely breakfast, feel free to spend this day at leisure.

            You can enjoy shopping at the local market and explore the city on your own.
            
            In the evening, head to the beach bars and enjoy the happening nightlife of the city.
            
            Return to the hotel for an overnight stay.","After having breakfast, check-out from the hotel and get transferred to the airport for your return flight and say goodbye to Cape Town."]
        url = "https://pixabay.com/api/?key=20881751-dd7fb42383b27ec4a1d57dca8&q=SouthAfrica&image_type=photo&pretty=true&page=1&per_page=3"
        uri = URI.parse(url)
        response = Net::HTTP.get_response(uri)
        response.body
        @image1 = JSON.parse(response.body)["hits"][0]["largeImageURL"]
        @image2 = JSON.parse(response.body)["hits"][1]["largeImageURL"]
        @image3 = JSON.parse(response.body)["hits"][2]["largeImageURL"]
        @package = "South Africa"
    elsif (params[:name] == "Egypt")
        @title = ["Arrival at Cairo"," Trip to Egypt Pyramids","Cairo Sightseeing Tour","Cairo to Amman Transfer","Dead Sea Tour in Madaba"," Petra City Tour","Departure"]
        @body = ["Upon arrival at Cairo, you will be picked up from the airport by our representative and will be accompanied to the hotel to embark upon your Egypt tour package from India.

            As you reach the hotel, check-in and spend the remaining day leisurely.
            
            Review your further itinerary with our representative and have an overnight stay at the hotel.","Wake up to a beautiful morning and after breakfast, head out for a tour of Egyptian Pyramids.

            Reach Giza Plateau, where you will get to witness the gigantic pyramids of Cheops, Chefren and Mycerinus.
            
            Explore the popular spots like Sphinx and valley temple, if you wish to learn more about the pyramids, go for a visit to the Solar Boat Museum.
            
            After the tour, have lunch at a local restaurant and set out to visit the Saqqara complex.
            
            You will also witness the oldest pyramid in history, known as Djoser Pyramid.
            
            After a full day of exploration, return to the hotel for an overnight stay.","After having breakfast, get ready to explore the famous tourist attractions of Cairo city.

            The first stop as per your Egypt tour package from India is Egyptian Museum, where you will see a vast collection of artefacts from the golden era.
            
            Learn about the process of mummification by taking a ticket to the Mummification room at the museum.
            
            Later, proceed to a local restaurant and relish some delicious meal for lunch.
            
            Our next stop is Coptic Cairo, where you will visit the Hanging Church and Ben Ezra Jewish Synagogue.
            
            Next stop is Islamic Cairo to witness the Khan El Khalili and take a stroll around Cairo’s old bazaar for some shopping.
            
            As the day ends, you will be escorted back to your hotel for an overnight stay.","After a wholesome breakfast, check-out from the hotel and get dropped off at Cairo International Airport to catch a flight to Amman.

            Arrive at Queen Alia airport, where our representative will greet you and after completing the Customs and Immigration formalities, you will be taken to your pre-booked hotel.
            
            Check-in at the hotel and spend the remaining day at ease.
            
            Have an overnight stay at the hotel.","After having breakfast, you will be driven to Mount Nebo to visit the pilgrimage devoted to Moses.

            Later, you will be visiting the old monastery and witness a mesmerizing view of the Jordan Valley, dead sea, Jericho and Jerusalem.
            
            Travel to Madaba and take a tour of the St. George church, where you will see the mosaic 6th century map of Palestine.
            
            Now, head to visit the Dead Sea, the lowest point on earth, this area was once considered to be 5 biblical cities called Sodom, Gomorrah, Adman, Zebouin and Zoar (Bela).
            
            You can take a dip in the Dead sea and can float easily due to its mineral concentration, marine life does not exist here.
            
            After the trip, head back to the hotel for an overnight stay as mentioned in your Egypt package from India.","Savour a hot-piping breakfast and set out for a trip to the ancient city of Petra.

            Witness the reminisce of the ancient city as you drive towards the entrance from the mountainsides.
            
            Reach the visitor's centre and take a walk to the Siq entrance. Witnessing the magnificent rock-cut architecture, rose-red sandstone rock facades, tombs, and temples
            
            After exploring the red-rose city, head back to Amman for an overnight stay at the hotel.","After having breakfast, check-out from the hotel and get dropped off at the airport for your return journey as your Egypt travel package from India ends here."]
        url = "https://pixabay.com/api/?key=20881751-dd7fb42383b27ec4a1d57dca8&q=Egypt&image_type=photo&pretty=true&page=1&per_page=3"
        uri = URI.parse(url)
        response = Net::HTTP.get_response(uri)
        response.body
        @image1 = JSON.parse(response.body)["hits"][0]["largeImageURL"]
        @image2 = JSON.parse(response.body)["hits"][1]["largeImageURL"]
        @image3 = JSON.parse(response.body)["hits"][2]["largeImageURL"]
        @package = "Egypt"
    end
    

end
end 

