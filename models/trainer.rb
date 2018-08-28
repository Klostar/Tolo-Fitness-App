require_relative("../db/sql_runner.rb")

class Trainer

  attr_reader :id
  attr_accessor :name, :specialty

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @job_title = options['job_title']
    @specialty = options['specialty']
  end

  def name
    return @name
  end

  def specialty
    return @specialty
  end

  def job_title
    return @job_title
  end

def save()
  sql = "INSERT into trainers
        (name,job_title,specialty) VALUES ($1,$2,$3)
        RETURNING id"
  values =[@name,@job_title,@specialty]
  result=SqlRunner.run(sql,values)
  @id = result.first()['id'].to_i
end

def update()
  sql="UPDATE trainers SET(name,job_title,specialty)
        =($1,$2,$3) WHERE id = $4"
  values =[@name,@job_title,@specialty,@id]
  SqlRunner.run(sql,values)
end

def delete ()
  sql="DELETE FROM trainers WHERE id = $1"
    valies =[@id]
    SqlRunner.run(sql,values)
  end

def self.all()
  sql="SELECT DISTINCT ON (name,job_title,specialty)* FROM trainers;"
  trainers = SqlRunner.run(sql)
  return trainers.map{ |trainer| Trainer.new(trainer)}
end

def self.find(id)
  sql="SELECT * FROM trainers WHERE id = $1"
  values=[id]
  trainer = SqlRunner.run(sql,values)
  result = Trainer.new(trainer.first)
  return result
end


end
