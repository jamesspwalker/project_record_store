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
  post '/albums' do
    @album = Album.new( params )
    @album.save()
    redirect to '/albums'
  end

#edit
  get '/albums/:id/edit' do
    @album = Album.find( params[:id] )
    @artists = Artist.all()
    erb( :"albums/edit")
  end

#update
  post '/albums/:id' do
    Album.new( params ).update()
    redirect to '/albums'
  end

#destroy
  post '/albums/:id/delete' do
    album = Album.find( params[:id] )
    album.delete()
    redirect to '/albums'
  end
