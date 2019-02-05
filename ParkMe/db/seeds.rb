# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Listing.create(title: "Parking near Bronx Zoo ", image:  "https://dmtyylqvwgyxw.cloudfront.net/instances/5020/uploads/images/photo/image/32061/golden_ff5bbc2f-32bd-4eee-8fec-dc970a21dcfd.JPG?v=1502476197", description: "Large Driveway within walking distance to the Bronx Zoo", location:"Bronx", price: 24.99, user_id: 1)

Listing.create(title: "Parking near Supreme Court ", image: "http://www.brooklynpaper.com/assets/photos/31/15/31_15_ridgecurbcuts4_z.jpg", description: "This is a full car Driveway. Please note this is only available during the day.", location: "Brooklyn", price: 14.99, user_id: 1)

Listing.create(title: "Parking near JFK", image:  "http://oliveridgespaniels.com/wp-content/uploads/2018/06/vinyl-fence-driveway-gates-breathtaking-pvc-olympic-decorating-ideas-46.jpg", description: "Great long term spot", location: "Queens", price: 14.99, user_id: 1)

Listing.create(title: "Parking near WeWork Dumbo", image:  "http://www.ironworkdesigns.com/images/drivewayandentrancesgates.jpg", description: "Secure driveway with survalliance 24hrs. ", location:"Brooklyn", price: 17.99, user_id: 1)

Listing.create(title: "Parking near Amazon NYC HQ", image:  "https://c1.staticflickr.com/4/3822/33616752331_9f9aa177e1_b.jpg", description: "Stuck finding a spot right before your job interview at Amazon? ", location:"Long Island City", price: 19.99, user_id: 1)
