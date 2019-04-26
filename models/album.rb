require_relative('../db/sql_runner')

class Album

  attr_reader( :id, :name, :artist_id )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @artist_id = options['artist_id'].to_i
  end

  def save()
    sql = "INSERT into albums(name, artist_id)
    VALUES($1, $2)
    RETURNING id"
    values = [@name, @artist_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end
  
end
