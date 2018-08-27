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
  erb( :"bookings/index")
end

get '/bookings/new' do
  erb(:new)
end

# #
