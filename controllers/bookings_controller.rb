require( 'sinatra' )
require( 'sinatra/contrib/all' )
require ( 'pry-byebug' )

require_relative('../models/booking.rb')
require_relative('../models/client.rb')
require_relative('../models/gymclass.rb')

also_reload( '../models/*' )

#index
get '/bookings' do
  @bookings = Booking.all()
  erb( :"bookings/index" )
end

#create new booking
get '/bookings/new' do
  @gymclass = GymClass.all
  @client = Client.all
  erb( :"bookings/new" )
end
#
# #update
#
# post '/bookings' do
#   @booking = Booking.new(params)
#   @booking.save()
#   redirect to("/bookings")
#
# end

#delete



# #
