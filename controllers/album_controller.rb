require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/album.rb' )
require_relative( '../models/artist.rb' )
also_reload( '../models/*' )

#index
get '/albums' do
  @albums = Album.all()
  erb ( :"albums/index" )
end

#new
  get '/albums/new' do
    @artists = Artist.all()
    erb ( :"albums/new" )
  end

#show
  get '/albums/:id' do
    @album = Album.find( params[:id].to_i )
    erb ( :"albums/show" )
  end

#create

#edit
#update
#destroy
