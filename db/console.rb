require('pry-byebug')
require_relative('../models/albums.rb')
require_relative('../models/artists.rb')


Album.delete_all()
Artist.delete_all()


artist1 = Artist.new({
  'name' => 'Snoop Dogg' })

artist2 = Artist.new({
  'name' => 'Queen' })

artist1.save()
artist2.save()



album1 = Album.new({
  'title' => 'Doggystyle',
  'genre' => 'HipHop',
  'artist_id' => artist1.id
  })

album2 = Album.new({
  'title' => 'R&G',
  'genre' => 'HipHop',
  'artist_id' => artist1.id
  })

album3 = Album.new({
  'title' => 'The Works',
  'genre' => 'Rock',
  'artist_id' => artist2.id
  })


album1.save()
album2.save()
album3.save()


binding.pry
nil