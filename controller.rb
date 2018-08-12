require 'sinatra'
require 'sinatra/contrib/all'
require 'pry-byebug'

require_relative 'models/category.rb'
require_relative 'models/merchant.rb'
require_relative 'models/category.rb'

also_reload('models/*')


get '/tracker/view/merchant' do
  @transactions = Transaction.all()
  @merchants = Merchant.all()
  erb(:index_merchant)
end

get '/tracker/view/transaction' do
  @transactions = Transaction.all()
  erb(:index_transaction)
end

get '/tracker/view/category' do
  @transactions = Transaction.all()
  @categories = Category.all()
  erb(:index_category)
end


#
# get '/hogwarts' do
#   @students = Student.all()
#   erb(:index)
# end
#
# get '/hogwarts/new' do
#   @houses = House.all()
#   erb(:new)
# end
#
# post '/hogwarts' do
#   @student = Student.new(params)
#   @student.save()
#   erb(:create)
# end
