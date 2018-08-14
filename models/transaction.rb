require_relative '../db/sql_runner.rb'


class Transaction

  attr_reader :id
  attr_accessor :amount, :merchant_id, :category_id, :time_stamp

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @merchant_id = options['merchant_id'].to_i()
    @category_id = options['category_id'].to_i()
    @amount = options['amount'].to_f()
    @time_stamp = options['time_stamp']

  end

  def save()
    sql = "INSERT INTO transactions (merchant_id, category_id, amount, time_stamp) VALUES ($1, $2, $3, $4) RETURNING id"
    values = [@merchant_id, @category_id, @amount, @time_stamp]
    result = SqlRunner.run(sql, values).first
    @id = result['id'].to_i()
  end

  def self.all()
    sql = "SELECT * FROM transactions"
    result = SqlRunner.run(sql)
    return result.map { |transaction| Transaction.new(transaction)  }
  end

  def update()
    sql = "UPDATE transactions SET (merchant_id, category_id, amount, time_stamp) = ($1, $2, $3, $4) WHERE id = $5"
    values = [@merchant_id, @category_id, @amount, @time_stamp, @id]
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

  def merchant
    sql = "SELECT merchants.* FROM merchants
           WHERE merchants.id = $1"
    values =[@merchant_id]
    result = SqlRunner.run(sql, values).first
    return Merchant.new(result)
  end

  def category
    sql = "SELECT categories.* FROM categories
           WHERE categories.id = $1"
    values =[@category_id]
    result = SqlRunner.run(sql, values).first
    return Category.new(result)
  end

  def self.order_ascending
    sql = "SELECT * FROM transactions ORDER BY time_stamp"
    result = SqlRunner.run(sql)
    return result.map { |transaction| Transaction.new(transaction)  }
  end

  def self.order_descending
    sql = "SELECT * FROM transactions ORDER BY time_stamp desc"
    result = SqlRunner.run(sql)
    return result.map { |transaction| Transaction.new(transaction)  }
  end

  def self.order_ascending_amount
    sql = "SELECT * FROM transactions ORDER BY amount"
    result = SqlRunner.run(sql)
    return result.map { |transaction| Transaction.new(transaction)  }
  end

  def self.order_descending_amount
    sql = "SELECT * FROM transactions ORDER BY amount desc"
    result = SqlRunner.run(sql)
    return result.map { |transaction| Transaction.new(transaction)  }
  end

end
