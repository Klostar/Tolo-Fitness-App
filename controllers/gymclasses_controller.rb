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

#new
get '/gymclasses/new' do
  erb(:"gymclasses/new")
end

#show

get '/gymclasses/:id' do
  @gymclass = GymClass.find( params[:id] )
  erb( :"gymclasses/show" )

  # #create
  # post "/gymclasses/:id" do
  #   @gymclass = Gymclass.new(params)
  #   @gymclass.save
  #   erb(:create)
  # end

# get '/gymclasses/:id/edit' do
#   @gymclass = GymClass.find(params[:id])
# end

end
