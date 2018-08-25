require_relative("../db/sql_runner.rb")

class Booking

  attr_reader :id, :type, :client, :instructor
  attr_accessor :capacity

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


end
