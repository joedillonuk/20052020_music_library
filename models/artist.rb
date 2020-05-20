require('pg')
require_relative('album')
require_relative('../db/sql_runner')

class Artist

  attr_accessor :name
  attr_reader :id

  def initialize(options)
    @name = options['name']
    @id = options['id'].to_i if options['id']
  end


  def save()
    sql = "INSERT INTO artists
    (
      name
    )
    VALUES (
      $1
      ) RETURNING id"
      values = [@name]

      returned_array = SqlRunner.run(sql, values)
      order_hash = returned_array[0]
      @id = order_hash['id'].to_i
    end

    def self.delete_all()
      sql = "DELETE FROM artists"
      SqlRunner.run(sql)
    end

    def self.all()
      sql = "SELECT * FROM artists"
      artist = SqlRunner.run(sql)
      return artists.map { |artist| Artist.new(artist)}
    end

    # List all albums by an artist
    def albums()
      sql = "SELECT * FROM albums WHERE artist_id = $1"
      values = [@id]
      results = SqlRunner.run(sql, values)
      albums = results.map{|album| Album.new(album)}
      return albums
    end

    # Update Artist/album
    def update()
      sql = "UPDATE artists SET name = $1 WHERE id = $2"
      values = [@name, @id]
      SqlRunner.run(sql, values)
    end

    # Delete specific artist/albums
    def delete() #delete by id
      sql = "DELETE FROM artists WHERE id = $1"
      values = [@id]
      SqlRunner.run(sql, values)
    end

    # Find Artist/Album by ID
    def Artist.find_by_id(id)
      sql = "SELECT * FROM artists WHERE id = $1"
      values = [id]
      result = SqlRunner.run(sql, values)
      return Artist.new(result[0])
    end

    
  end
