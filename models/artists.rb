require('pg')


class Artist

  def initialize(params)

    @id = params['id'].to_i if ['id']
    @name = params['name']


  end



end