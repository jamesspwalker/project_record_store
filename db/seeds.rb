require_relative( "../models/album.rb" )
require_relative( "../models/artist.rb" )
require( "pry-byebug" )

Artist.delete_all()
Album.delete_all()

artist1 = Artist.new({
  "name" => "Bob the Builder"
  })

artist2 = Artist.new({
  "name" => "Bart Simpson"
  })



  artist1.save()
  artist2.save()

album1 = Album.new({
  "name" => "Can we fix it",
  "artist_id" => artist1.id,
  "stock" => 8,
  "rating" => 4
  })

album2 = Album.new({
  "name" => "Do the Bartman",
  "artist_id" => artist2.id,
  "stock" => 12,
  "rating" => 3
  })

  album1.save()
  album2.save()

  p Artist.all()

  p artist1.albums()

# binding.pry
# nil
