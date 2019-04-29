require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/artist.rb' )
also_reload( '../models/*' )

#index
  get '/artists' do
    @artists = Artist.all()
    erb ( :"artists/index" )
  end

#new
  get '/artists/new' do
    erb( :"artists/new" )
  end
#show
  get '/artists/:id' do
    @artist = Artist.find( params[:id] )
    erb( :"artists/show" )
  end
#create
  get 
#edit
#update
#destroy
