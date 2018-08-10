require_relative '../db/sql_runner.rb'


class User

  attr_reader :id
  attr_accessor :budget, :name

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @name = options['name']
    @budget = options['budget'].to_f()
  end

  def save()
    sql = "INSERT INTO users (name, budget) VALUES ($1, $2) RETURNING id"
    values = [@name, @budget]
    result = SqlRunner.run(sql, values).first
    @id = result['id'].to_i()
  end

  def self.all()
    sql = "SELECT * FROM users"
    result = SqlRunner.run(sql)
    return result.map { |user| User.new(user)  }
  end

  def update()
    sql = "UPDATE users SET (name, budget) = ($1, $2) WHERE id = $3"
    values = [@name, @budget, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM users WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM users"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM users WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    return User.new(result)
  end


end
