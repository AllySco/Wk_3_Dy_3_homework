require('pry-byebug')
require_relative('../models/albums.rb')
require_relative('../models/artists.rb')

artist1 = Artist.new({
  'name' => 'Snoop Dogg' })

artist2 = Artist.new({
  'name' => 'Queen' })



album1 = Album.new({
  'title' => 'Doggystyle',
  'genre' => 'HipHop'
  'artist_id' => artist1.id
  })

album2 = Album.new({
  'title' => 'R&G',
  'genre' => 'HipHop'
  'artist_id' => artist1.id
  })

album3 = Album.new({
  'title' => 'The Works',
  'genre' => 'Rock'
  'artist_id' => artist2.id
  })

