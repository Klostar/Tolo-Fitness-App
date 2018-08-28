require_relative("../db/sql_runner.rb")

class Booking

  attr_reader :id
  attr_accessor :client_id, :gymclass_id

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @client_id = options['client_id'].to_i
    @gymclass_id = options['gymclass_id'].to_i
  end

  def save()
    sql = "INSERT INTO bookings
    (client_id,gymclass_id)
    VALUES($1,$2) RETURNING id"
    values = [@client_id, @gymclass_id]
    result = SqlRunner.run(sql,values)
    @id = result.first()['id'].to_i
  end

def update()
sql = " UPDATE clients SET (client_id,gymclass_id) =
        ($1, $2) WHERE id = $3"
values =[@client_id,@gymclass_id]
SqlRunner.run(sql,values)
end

def delete()
sql = "DELETE * FROM bookings WHERE id = $1"
values = [@id]
SqlRunner.run(sql,values)
end

  def gymclass()
    sql = "SELECT * FROM gymclasses WHERE id = $1"
    values = [@gymclass_id]
    gymclass = SqlRunner.run(sql,values).first
    return GymClass.new(gym_class)
  end

  def client()
    sql = "SELECT * FROM clients WHERE id = $1"
    values =[@client_id]
    clients = SqlRunner.run(sql,values).first
    return Client.new(client)
  end

  def self.delete_all
    sql = "DELETE FROM bookings"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM bookings"
    data = SqlRunner.run(sql)
    return data.map{ |booking| Booking.new(booking)}
  end

def self.destroy(id)
  sql = " DELETE FROM bookings WHERE id = $1"
  values=[id]
  booking = SqlRunner.run(sql,values)
end

end
