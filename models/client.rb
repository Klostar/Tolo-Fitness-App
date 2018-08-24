require_relative("../db/sql_runner.rb")

class Client

  attr_reader :id
  attr_accessor :first_name, :last_name, :age

  def initialize( options )
    @id = options['id'].to_i
    @first_name = options['first_name']
    @last_name = options['last_name']
    @age = options['age'].to_i
  end

  def full_name
    return "#{@first_name} #{@last_name}"
  end

def save()
sql = "INSERT INTO clients
      (first_name,last_name,age)
      VALUES($1,$2,$3) RETURNING id"
values = [@first_name,@last_name,@age]
result = SqlRunner.run(sql,values)
@id = result.first()['id'].to_i
end

def update()
sql = "UPDATE clients
      SET(first_name,last_name,age) =
          ($1,$2,$3) WHERE id = $4"
values =[@first_name,@last_name,@age,@id]
SqlRunner.run(sql,values)
end


def self.all()
  sql = "SELECT * FROM clients"
  result = SqlRunner.run(sql)
  return clients.map{ |client| Client.new(client)}
end


end
