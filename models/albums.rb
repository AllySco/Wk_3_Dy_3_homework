require_relative('../db/sql_runner.rb')
require_relative('artists.rb')


class Album

  attr_reader :id, :artist_id
  attr_accessor :title, :genre

  def initialize(params)
    @id = params['id'].to_i if ['id']
    @title = params['title']
    @genre = params['genre']
    @artist_id = params['artist_id'].to_i
  end

  def save()
    sql = "INSERT INTO albums (
    title,
    genre,
    artist_id
    ) VALUES (
    '#{@title}',
    '#{@genre}',
    #{@artist_id}
    )
    RETURNING *;"

    result = SqlRunner.run(sql)
    result_hash = result.first()
    new_id = result_hash['id'].to_i
    @id = new_id
  end


  def Album.all
    sql = "SELECT * FROM albums;"
    result = SqlRunner.run(sql)
    return result.map { |album| Album.new(album) }
  end

  def  artist_on_this_album
    sql = "SELECT * FROM artists
    WHERE id = #{@artist_id};"
    results = SqlRunner.run(sql)
    artist_hash = results.first()
    artist_object = Artist.new(artist_hash)
    return artist_object
  end

  def Album.delete_all
    sql = "DELETE FROM albums;"
    SqlRunner.run(sql)
  end

  def Album.find(id)
    sql = "SELECT * FROM albums WHERE id = #{id}"
    results = SqlRunner.run(sql)
    album_hash = results.first
    album = Album.new(album_hash)
    return album
  end

  def update()
    sql = "
    UPDATE albums SET (
      title,
      genre,
      artist_id
    ) = (
      '#{ @title }',
      '#{ @genre }',
      #{ @artist_id } )
    WHERE id = #{ @id }"
    SqlRunner.run(sql)
  end



end