require_relative('../db/sql_runner')

class Album

  attr_reader( :id, :name, :artist_id, :stock, :rating)

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @artist_id = options['artist_id'].to_i
    @stock = options['stock']
    @rating = options['rating'].to_i
  end

  def save()
    sql = "INSERT into albums(name, artist_id, stock, rating)
    VALUES($1, $2, $3, $4)
    RETURNING id"
    values = [@name, @artist_id, @stock, @rating]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def artist()
    sql = "SELECT * FROM artists
    WHERE id = $1"
    values = [@artist_id]
    artist = SqlRunner.run( sql,values )
    result = Artist.new( artist.first )
    return result
  end

  def update()
    sql = "UPDATE albums SET
    (name, artist_id, stock, rating)
    = ($1, $2, $3, $4)
    WHERE id = $5"
    values = [@name, @artist_id, @stock, @rating, @id]
    SqlRunner.run(sql, values)
  end


  def self.all()
    sql = "SELECT * FROM albums"
    results = SqlRunner.run(sql)
    return results.map{|hash| Album.new(hash)}
  end

  def self.find(id)
    sql = "SELECT * FROM albums WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Album.new( results.first )
  end

  def delete()
    sql = "DELETE from albums WHERE id = $1"
    values =[@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all
    sql = "DELETE FROM albums"
    SqlRunner.run( sql )
  end

end
