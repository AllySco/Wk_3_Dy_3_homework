require_relative('../db/sql_runner.rb')
require_relative('albums.rb')



class Artist

  attr_reader :id
  attr_accessor :name

  def initialize(params)
    @id = params['id'].to_i if ['id']
    @name = params['name']
  end


  def save()
    sql = "INSERT INTO artists (
    name
    ) VALUES (
    '#{@name}'
    )
    RETURNING *;"
    result = SqlRunner.run(sql)
    result_hash = result.first()
    new_id = result_hash['id'].to_i
    @id = new_id
  end

  def Artist.all
      sql = "SELECT * FROM artists;"
      result = SqlRunner.run(sql)
      return result.map { |artist| Artist.new(artist) }
  end


  def albums_by_this_artist
    sql = "SELECT * FROM albums
    WHERE artist_id = #{@id};"
    album_hashes = SqlRunner.run(sql)
    album_objects = album_hashes.map { |album_hash| Album.new(album_hash) }
    return album_objects
  end

  def Artist.delete_all
    sql = "DELETE FROM artists;"
    SqlRunner.run(sql)
  end

  def Artist.find(id)
    sql = "SELECT * FROM artists WHERE id = #{id}"
    results = SqlRunner.run(sql)
    artist_hash = results.first
    artist = Artist.new(artist_hash)
    return artist
  end


  def update()
    sql = "
    UPDATE artists SET (
      name
    ) = (
      '#{@name}')
    WHERE id = #{ @id }"
    SqlRunner.run(sql)
  end


end