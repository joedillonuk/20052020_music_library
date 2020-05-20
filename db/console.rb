require("pry")
require_relative("../models/album.rb")
require_relative("../models/artist.rb")

Album.delete_all()
Artist.delete_all()

artist1 = Artist.new({'name' => 'Tom Waits'})
artist1.save()


album1 = Album.new({
'title' => 'Nighthawks At The Diner',
'genre' => 'Jazz',
'year' => 1975,
'artist_id' => artist1.id
  })
album1.save()

p Album.all()
binding.pry
nil
