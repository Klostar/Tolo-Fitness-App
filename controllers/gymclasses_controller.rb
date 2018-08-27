require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug')

require_relative('../models/booking.rb')
require_relative('../models/client.rb')
require_relative('../models/gymclass.rb')

also_reload('../models/*')

#index

get '/gymclasses' do
@gymclass = GymClass.all()
erb( :"gymclasses/index" )
end

get '/gymclasses/new' do
  erb(:"gymclasses/new")
end
