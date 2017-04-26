require('pg')

class Album

  def initialize(params)
    @id = params['id'].to_i if ['id']
    @title = params['title']
    @genre = params['genre']
    @artist_id = params['artist_id'].to_i
  end







end