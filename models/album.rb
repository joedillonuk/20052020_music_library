require('pg')
require_relative('artist')
require_relative('../db/sql_runner')

class Album

  attr_accessor :title, :genre, :year, :artist_id
  attr_reader :id

  def initialize(options)
    @title = options['title']
    @genre = options['genre']
    @year = options['year'].to_i
    @id = options['id'].to_i if options['id']
    @artist_id = options['artist_id'].to_i
  end


  def save()
    sql = "INSERT INTO albums
    (
      title,
      genre,
      year,
      artist_id
    )
    VALUES (
      $1, $2, $3, $4
      ) RETURNING id"
      values = [@title, @genre, @year, @artist_id]

      returned_array = SqlRunner.run(sql, values)
      order_hash = returned_array[0]
      @id = order_hash['id'].to_i
    end


    def self.delete_all()
      sql = "DELETE FROM albums"
      SqlRunner.run(sql)
    end


    # List all albums
    def self.all()
      sql = "SELECT * FROM albums"
      albums = SqlRunner.run(sql)
      return albums.map { |album| Album.new(album)}
    end

    # List all albums by an artist


    # Get the artist for a particular album
    def artist()
      sql = "SELECT * FROM artists WHERE id = $1"
      values = [@artist_id]
      results = SqlRunner.run(sql, values)
      artist_data = results[0]
      artist = Artist.new(artist_data)
      return artist
    end




    # Update Artist/album
    def update()
      sql = "
      UPDATE albums SET (
        title,
        genre,
        year,
        artist_id
        ) =
        (
          $1, $2, $3, $4
        )
        WHERE id = $5"
        values = [@title, @genre, @year, @artist_id, @id]
        SqlRunner.run(sql, values)
      end
      

      # Delete specific artist/albums
      def delete() #delete by id
        sql = "DELETE FROM albums WHERE id = $1"
        values = [@id]
        SqlRunner.run(sql, values)
      end


      # Find Artist/Album by ID
      def Album.find_by_id(id)
        sql = "SELECT * FROM albums WHERE id = $1"
        values = [id]
        result = SqlRunner.run(sql, values)
        return Album.new(result[0])
      end

    end
