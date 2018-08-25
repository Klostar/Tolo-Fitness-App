require_relative("../db/sql_runner.rb")

class Booking

  attr_accessor :type, :client, :instructor
  attr_reader :id, :capacity

  def initialize( options )
    @id =options['id'].to_i
    @type =options ['type']
    @client =[]
    @instructor =options['instructor']
    @capacity =10
  end

  def full_capacity
    @capacity
    if @capacity > 10
      return "Sorry We Are Full"
    else
      return "Welcome"
    end
  end

def save()
  sql = "INSERT INTO bookings
  (type,instructor,capacity)
  VALUES($1,$2,$3) RETURNING id"
  values = [@type,@instructor,@capacity]
  result = SqlRunner.run(sql,values)
  @id = result.first()['id'].to_i
end

def update()
  sql = "UPDATE bookings
  SET(type,imstructor,capacity)
  = ($1,$2,$3) WHERE id = $4"
  values = [@type, @instructor, @capacity]
  SqlRunner.run(sql,values)
end

def delete()
  sql = "DELETE FROM bookings WHERE id = $1"
  values =[@id]
  SqlRunner.run(sql,values)
end

def self.all()
  sql = "SELECT * FROM bookings"
  bookings = SqlRunner.run(sql)
  return bookings.map{ |booking| Booking.new(booking)}
end

end
