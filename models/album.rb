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

      def self.all()
            sql = "SELECT * FROM albums"
            albums = SqlRunner.run(sql)
            return albums.map { |album| Album.new(album)}
          end




  end
