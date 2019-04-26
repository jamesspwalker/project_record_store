require_relative( '../db/sql_runner' )

class Artist

  attr_reader( :id, :name )

  def initialize (options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save()
    sql = "INSERT into artists (name) VALUES ($1) returning id"
    values = [@name]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def albums
    sql = "SELECT * FROM albums WHERE artist_id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map {|album_hash| Album.new(album_hash)}
  end

  def self.all()
    sql = "SELECT * FROM artists"
    results = SqlRunner.run( sql )
    return results.map{|hash| Artist.new(hash)}
  end

  def self.find(id)
    sql = "SELECT * FROM artists WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Artist.new( results.first )
  end

  def self.delete_all
    sql = "DELETE FROM artists"
    SqlRunner.run( sql )
  end

end
