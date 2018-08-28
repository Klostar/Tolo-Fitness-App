require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug')

require_relative('../models/booking.rb')
require_relative('../models/client.rb')
require_relative('../models/gymclass.rb')

also_reload('../models/*')

#index

get '/clients' do
  @client = Client.all()
  erb( :"clients/index" )
end

#new

get '/clients/new' do
  erb( :"clients/new" )
end

#show
get '/clients/:id' do
  @client = Client.find( params[:id] )
  erb( :"clients/show" )

end

#create
post '/clients/new' do
  @client = Client.new(params)
  @client.save
  redirect to '/clients'
end

#edit

get '/clients/:id/edit' do
  @client = Client.find(params[:id])
  erb(:'clients/edit')
end

#update

put '/clients/:id' do
  @client = Client.new( params )
  @client.update()
  redirect to '/clients'
end

#delete
post '/clients/:id/delete' do
@client = Client.find( params[:id] )
@client.delete()
redirect to '/clients'
end
