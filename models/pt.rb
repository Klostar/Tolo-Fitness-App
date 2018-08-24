require_relative("../db/sql_runner.rb")

class Pt

attr_reader :id
attr_accessor :name, :specialty

def initialize( options )
  @id = options['id'].to_i
  @name = options['name']
  @specialty = options['specialty']
end


end
