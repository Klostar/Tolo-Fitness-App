require_relative("../models/client.rb")
require_relative("../models/gymclass.rb")
require_relative("../models/booking.rb")
require("pry-byebug")

#ideally wouldnt have delete all method but wanted to have
# for practice only

Client.delete_all()
Booking.delete_all()
GymClass.delete_all()

client1 = Client.new({'first_name' => 'Ash','last_name' => 'Riley','age' => 32})
client1.save()

client2 = Client.new({'first_name' => 'Zoe','last_name' => 'Alexander','age' => 30})
client2.save()

client3 = Client.new({'first_name' => 'David','last_name' => 'Smith','age' => 28})
client3.save()

client4 = Client.new({'first_name' => 'John','last_name' => 'Caulfield','age' => 37})
client4.save

#gym classes

gymclass1 = GymClass.new({"type" => "bootcamp","instructor" => "thomas","capacity" => 10})
gymclass1.save()

gymclass2 = GymClass.new({"type" => "ladies who lift","instructor" => "sam","capacity" => 10})
gymclass2.save()

gymclass3 = GymClass.new({"type" => "kettlebells","instructor" => "jonny","capacity" => 10})
gymclass3.save()

gymclass4 = GymClass.new({"type" => "circuits","instructor" => "jonny","capacity" => 10})
gymclass4.save()

#bookings now joining table

booking1 = Booking.new({"client_id" => client1.id,"gymclass_id" => gymclass1.id})
booking1.save()

booking2 = Booking.new({"client_id" => client2.id,"gymclass_id" => gymclass2.id})
booking2.save()

booking3 = Booking.new({"client_id" => client3.id, "gymclass_id" => gymclass3.id})
booking3.save()

booking4 = Booking.new({ "client_id" => client4.id, "gymclass_id" => gymclass4.id })
booking4.save()

booking5 = Booking.new({"client_id" => client1.id, "gymclass_id" => gymclass4.id })
booking5.save()

binding.pry
nil
