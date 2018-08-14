require_relative '../db/sql_runner.rb'


class Budget

  attr_reader :id
  attr_accessor :total, :time_stamp

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @total = options['total'].to_f()
    @time_stamp = options['time_stamp']
  end

  def save()
    sql = "INSERT INTO budgets (total, time_stamp) VALUES ($1, $2) RETURNING id"
    values = [@total, @time_stamp]
    result = SqlRunner.run(sql, values).first
    @id = result['id'].to_i()
  end

  def self.all()
    sql = "SELECT * FROM budgets"
    result = SqlRunner.run(sql)
    return result.map { |budget| Budget.new(budget)  }
  end

  def update()
    sql = "UPDATE budgets SET (total, time_stamp) = ($1, $2) WHERE id = $3"
    values = [@total, @time_stamp, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM budgets WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM budgets"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM budgets WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    return Budget.new(result)
  end

  def budget_checker
    if total < 20
      'style="color:red;"'
    elsif total < 50
      'style="color:orange;"'
    end
  end

  def budget_checker_warning
    if total < 20
      'Warning very low budget!'
    elsif total < 50
      'Warning low budget!'
    else
      'Within Budget'
    end
  end

end
