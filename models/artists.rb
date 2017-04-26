require('pg')
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


  def albums_by_artist
    
  end



end