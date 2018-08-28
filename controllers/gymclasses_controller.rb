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
end

#create
post '/gymclasses' do
  @gymclass = GymClass.new( params )
  @gymclass.save
  redirect to '/gymclasses'
end

#edit
get '/gymclasses/:id/edit' do
  @gymclass = GymClass.find(params[:id])
  erb(:'gymclasses/edit')
end

#update

put '/gymclasses/:id' do
  @gymclass = GymClass.new(params)
  @gymclass.update()
  redirect to '/gymclasses'
end

#delete
post '/gymclasses/:id/delete' do
  @gymclass = GymClass.find( params[:id] )
  @gymclass.delete()
  redirect to '/gymclasses'
end
