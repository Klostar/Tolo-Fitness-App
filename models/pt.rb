require_relative("../db/sql_runner.rb")

class Pt

  attr_reader :id
  attr_accessor :name, :specialty, :client_id, :booking_id

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @specialty = options['specialty']
    @client_id = options['client_id'].to_i
    @booking_id = options['booking_id'].to_i
  end

  def save()
    sql = "INSERT INTO pts
    (name,specialty,client_id,booking_id)
    VALUES($1, $2, $3, $4) RETURNING id"
    values = [@name, @specialty, @client_id, @booking_id]
    pt = SqlRunner.run(sql,values).first()
    @id = pt['id'].to_i
  end


  def bookings()
    sql = "SELECT * FROM bookings WHERE id = $1"
    values = [@booking_id]
    booking = SqlRunner.run(sql,values).first
    return Booking.new(booking)
  end

  def clients()
    sql = "SELECT * FROM clients WHERE id = $1"
    values =[@client_id]
    client = SqlRunner.run(sql,values).first
    return Client.new(client)
  end


  def self.all()
    sql = "SELECT * FROM pts"
  data = SqlRunner.run(sql)
    return data.map{ |pt| Pt.new(pt)}
  end

end
