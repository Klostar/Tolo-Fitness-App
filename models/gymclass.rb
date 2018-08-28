require_relative("../db/sql_runner.rb")

class GymClass

  attr_accessor :type, :client, :instructor,:capacity
  attr_reader :id

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @type =options ['type']
    @client =[]
    @instructor =options['instructor']
    @capacity = 10
  end


  # this method will now be a method in the booking
  # def full_capacity
  #   if @capacity > 10
  #     return "Sorry We Are Full"
  #   else
  #     return "Welcome"
  #   end
  # end


  def save()
    sql = "INSERT INTO gymclasses
    (type,instructor,capacity)
    VALUES($1,$2,$3) RETURNING id"
    values = [@type,@instructor,@capacity]
    result = SqlRunner.run(sql,values)
    @id = result.first()['id'].to_i
  end

  def update()
    sql = "UPDATE gymclasses
    SET(type,instructor,capacity)
    = ($1,$2,$3) WHERE id = $4"
    values = [@type, @instructor, @capacity, @id]
    SqlRunner.run(sql,values)
  end

  def delete()
    sql = "DELETE FROM gymclasses WHERE id = $1"
    values =[@id]
    SqlRunner.run(sql,values)
  end

  # display all the clients for a particular gymclass
  def clients()
    sql = "SELECT clients.* FROM clients INNER JOIN bookings ON clients.id
    = bookings.client_id WHERE gymclass_id = $1"
    values =[@id]
    clients = SqlRunner.run(sql,values)
    result = clients.map{|client| Client.new(client)}
    return result
  end

  #display all bookings i have for a particular gym class as column didnt exist
  #needed double inner join

  def bookings()
    sql = "
    SELECT clients.* FROM clients INNER JOIN bookings ON clients.id
    = bookings.client_id INNER JOIN gymclasses ON gymclasses.id = bookings.gymclass_id WHERE
    gymclasses.id = $1 "
    values = [@id]
    bookings = SqlRunner.run(sql,values)
    result = bookings.map{|booking| Booking.new(booking)}
    return result
  end


  def self.all()
    sql = "SELECT * FROM gymclasses"
    gymclasses = SqlRunner.run(sql)
    return gymclasses.map{ |gymclass| GymClass.new(gymclass)}
  end

  #find by id method

def self.find(id)
  sql = "SELECT * FROM gymclasses WHERE id = $1"
  values =[id]
  gymclass = SqlRunner.run(sql,values)
  result = GymClass.new(gymclass.first)
  return result
end

  def self.delete_all()
    sql = "DELETE FROM gymclasses"
    SqlRunner.run(sql)
  end
end
