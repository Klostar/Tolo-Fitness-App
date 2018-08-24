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
  return "Sorry We Are Full" if @capacity > 10
else
  return "Welcome"
end

end
