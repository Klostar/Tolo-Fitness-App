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


# access to thomas further Info

get '/trainers/thomas' do
  erb(:"trainers/thomas")
end

# access to sam further info
get '/trainers/sam' do
  erb(:"trainers/sam")
end

#access to jonny further info
get '/trainers/jonny' do
  erb(:"trainers/jonny")
end
