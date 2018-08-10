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
  'budget' => 0
  })

user1.save()

#Seeding some categories:

category_transport = Category.new({
  'name' => 'transport'
    })

category_groceries = Category.new({
  'name' => 'groceries'
    })

category_entertainment = Category.new({
  'name' => 'entertainment'
    })

category_bills = Category.new({
  'name' => 'bills'
    })

category_gifts = Category.new({
      'name' => 'gifts'
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
  'amount' => 30.89,
  'category_id' => category_bills.id,
  'time_stamp' => Time.now()
  })

transaction1.save()

###CRUD tests here:
# transaction1.amount = 100
# transaction1.merchant_id = merchant_cineworld.id
# transaction1.category_id = category_gifts.id
# transaction1.update() #Works

# user1.budget = 0.11
# user1.update() # Works
# user1.delete() #Works

# merchant_tesco.name = "TEST"
# merchant_tesco.update() # Works
# merchant_malones.delete() # Works

# category_bills.name = "TEST"
# category_bills.update() # Works
# category_transport.delete() # Works


# binding.pry
# nil
