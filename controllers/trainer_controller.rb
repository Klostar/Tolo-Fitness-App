require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug')

require_relative('../models/booking.rb')
require_relative('../models/client.rb')
require_relative('../models/gymclass.rb')
require_relative('../models/trainer.rb')


also_reload('../models/*')

#index
get '/trainers' do
  @trainer = Trainer.all
  erb( :"trainers/index" )
end
