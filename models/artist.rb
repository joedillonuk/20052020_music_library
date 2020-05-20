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







  end
