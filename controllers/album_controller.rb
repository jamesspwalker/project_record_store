require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/album.rb' )
also_reload( '../models/*' )

#index
get '/albums' do
  @albums = Album.all()
  erb ( :"albums/index" )
end

#new

#show
#create
#edit
#update
#destroy
