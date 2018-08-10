require_relative '../models/category.rb'
require_relative '../models/merchant.rb'

require 'pry-byebug'

Category.delete_all()
Merchant.delete_all()

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




###CRUD tests here:
# merchant_tesco.name = "TEST"
# merchant_tesco.update() # Works
# merchant_malones.delete() # Works

# category_bills.name = "TEST"
# category_bills.update() # Works
# category_transport.delete() # Works


# binding.pry
# nil
