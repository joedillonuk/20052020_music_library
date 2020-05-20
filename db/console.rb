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
album2 = Album.new({
'title' => 'Rain Dogs',
'genre' => 'Rock',
'year' => 1985,
'artist_id' => artist1.id
  })
album2.save()


p "The artist of #{album1.title} is #{album1.artist().name}."
p album2
album2.title = 'Swordfishtrombones'
album2.year = 1983
album2.update()
p album2
binding.pry
nil
