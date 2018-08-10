require_relative '../models/category.rb'

require 'pry-byebug'

Category.delete_all()

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

category_bills.save()
category_entertainment.save()
category_groceries.save()
category_transport.save()


###CRUD tests here:


# category_bills.name = "TEST"
# category_bills.update() # Works
# category_transport.delete() # Works
