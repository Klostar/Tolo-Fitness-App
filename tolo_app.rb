require( 'sinatra' )
require( 'sinatra/contrib/all' )
require ( 'pry-byebug' )

# require_relative('./models/booking.rb')
# require_relative('./models/client.rb')
# require_relative('./models/gymclass.rb')
require_relative('./controllers/bookings_controller.rb')
require_relative('./controllers/client_controller.rb')
require_relative('./controllers/gymclasses_controller.rb')


also_reload( './models/*' )

#index
get '/' do
  erb(:index)
end



#
