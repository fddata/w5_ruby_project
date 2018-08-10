require_relative '../db/sql_runner.rb'


class Transaction

  attr_reader :id, :user_id
  attr_accessor :amount, :merchant_id, :category_id, :time_stamp

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @merchant_id = options['merchant_id'].to_i()
    @category_id = options['category_id'].to_i()
    @amount = options['amount'].to_f()
    @user_id = options['user_id'].to_i()
    @time_stamp = options['time_stamp']

  end

  def save()
    sql = "INSERT INTO transactions (merchant_id, category_id, amount, user_id, time_stamp) VALUES ($1, $2, $3, $4, $5) RETURNING id"
    values = [@merchant_id, @category_id, @amount, @user_id, @time_stamp]
    result = SqlRunner.run(sql, values).first
    @id = result['id'].to_i()
  end

  def self.all()
    sql = "SELECT * FROM transactions"
    result = SqlRunner.run(sql)
    return result.map { |transaction| Transaction.new(transaction)  }
  end

  def update()
    sql = "UPDATE transactions SET (merchant_id, category_id, amount, user_id, time_stamp) = ($1, $2, $3, $4, $5) WHERE id = $6"
    values = [@merchant_id, @category_id, @amount, @user_id, @time_stamp, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM transactions WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM transactions"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM transactions WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    return Transaction.new(result)
  end


end
