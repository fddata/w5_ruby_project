require_relative '../models/category.rb'
require_relative '../models/merchant.rb'
require_relative '../models/user.rb'
require_relative '../models/transaction.rb'

require 'pry-byebug'

Category.delete_all()
Merchant.delete_all()
User.delete_all()
Transaction.delete_all()


#Seeding a user:
user1 = User.new({
  'name' => 'user1',
  'budget' => 100
  })

user1.save()

#Seeding some categories:

category_transport = Category.new({
  'name' => 'Transport'
    })

category_groceries = Category.new({
  'name' => 'Groceries'
    })

category_entertainment = Category.new({
  'name' => 'Entertainment'
    })

category_bills = Category.new({
  'name' => 'Bills'
    })

category_gifts = Category.new({
      'name' => 'Gifts'
        })

category_bills.save()
category_entertainment.save()
category_groceries.save()
category_transport.save()
category_gifts.save()


#Seeding some merchants

merchant_tesco = Merchant.new({
  'name' => 'Tesco'
  })

merchant_cineworld = Merchant.new({
  'name' => 'Cineworld'
  })

merchant_malones = Merchant.new({
  'name' => 'Malones'
  })

merchant_tesco.save()
merchant_malones.save()
merchant_cineworld.save()

#Seeding some transactions
transaction1 = Transaction.new({
  'merchant_id' => merchant_tesco.id,
  'user_id' => user1.id,
  'amount' => 3.67,
  'category_id' => category_bills.id,
  'time_stamp' => Time.utc(2018, 'jul',15,17,52,16)
  })

transaction1.save()


transaction2 = Transaction.new({
  'merchant_id' => merchant_cineworld.id,
  'user_id' => user1.id,
  'amount' => 15.78,
  'category_id' => category_entertainment.id,
  'time_stamp' => Time.now()
  })

transaction2.save()

transaction3 = Transaction.new({
  'merchant_id' => merchant_tesco.id,
  'user_id' => user1.id,
  'amount' => 20,
  'category_id' => category_entertainment.id,
  'time_stamp' => Time.now()
  })

transaction3.save()

###CRUD tests here:
# transaction1.amount = 100
# transaction1.merchant_id = merchant_cineworld.id
# transaction1.category_id = category_gifts.id
# transaction1.update() #Works
# transaction1.delete() #Works

# user1.budget = 0.11
# user1.update() # Works
# user1.delete() #Works

# merchant_tesco.name = "TEST"
# merchant_tesco.update() # Works
# merchant_malones.delete() # Works

# category_bills.name = "TEST"
# category_bills.update() # Works
# category_transport.delete() # Works


binding.pry
nil
