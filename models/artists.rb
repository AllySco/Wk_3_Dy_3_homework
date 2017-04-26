require('pg')


class Artist

  attr_reader :id
  attr_accessor :name

  def initialize(params)

    @id = params['id'].to_i if ['id']
    @name = params['name']


  end



end