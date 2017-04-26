require('pg')
require_relative('../db/sql_runner.rb')


class Album

  attr_reader :id, :artist_id
  attr_accessor :title, :genre

  def initialize(params)
    @id = params['id'].to_i if ['id']
    @title = params['title']
    @genre = params['genre']
    @artist_id = params['artist_id'].to_i
  end







end