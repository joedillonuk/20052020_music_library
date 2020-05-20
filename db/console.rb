require("pry")
require_relative("../models/album.rb")
require_relative("../models/artist.rb")

Album.delete_all()
Artist.delete_all()

artist1 = Artist.new({'name' => 'Tom Waits'})
artist1.save()
artist2 = Artist.new({'name' => 'Nick Cave'})
artist2.save()
artist3 = Artist.new({'name' => 'Sheer Mag'})
artist3.save()
artist4 = Artist.new({'name' => 'PJ Harvey'})
artist4.save()
artist5 = Artist.new({'name' => 'Manowar'})
artist5.save()

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

album3 = Album.new({
'title' => 'Bad As Me',
'genre' => 'Rock',
'year' => 2011,
'artist_id' => artist1.id
  })
album3.save()


album4 = Album.new({
'title' => 'Murder Ballads',
'genre' => 'Rock',
'year' => 1996,
'artist_id' => artist2.id
  })
album4.save()

album5 = Album.new({
'title' => 'Dig, Lazarus, Dig!!!',
'genre' => 'Rock',
'year' => 2008,
'artist_id' => artist2.id
  })
album5.save()

album6 = Album.new({
'title' => 'Need To Feel Your Love',
'genre' => 'Punk',
'year' => 2017,
'artist_id' => artist3.id
  })
album6.save()

album7 = Album.new({
'title' => 'Stories from the City, Stories from the Sea',
'genre' => 'Rock',
'year' => 2020,
'artist_id' => artist4.id
  })
album7.save()

album8 = Album.new({
'title' => 'Fighting The World',
'genre' => 'Metal',
'year' => 2087,
'artist_id' => artist5.id
  })
album8.save()

p "The artist of #{album1.title} is #{album1.artist().name}."

# Updating album2 from Rain Dogs to Swordfishtrombones.
p album2
album2.title = 'Swordfishtrombones'
album2.year = 1983
album2.update()
p album2

# Listing all albums by artist1 (Tom Waits)
p artist1.albums()

# Updating artist2's name
p artist2.name
artist2.name = 'Nick Cave & The Bad Seeds'
artist2.update()
p artist2.name



binding.pry
nil
