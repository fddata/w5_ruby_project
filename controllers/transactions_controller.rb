require 'sinatra'
require 'sinatra/contrib/all'
require 'pry-byebug'

require_relative '../models/category.rb'
require_relative '../models/merchant.rb'
require_relative '../models/transaction.rb'
require_relative '../models/budget.rb'


also_reload('models/*')

#INDEX
get '/tracker/view/transaction' do
  @transactions = Transaction.all()
  erb(:"transactions/index_transaction")
end

#SHOW

#NEW
get '/tracker/new/transaction' do
  @merchants = Merchant.all()
  @categories = Category.all()
  erb(:"transactions/new_transaction")
end

#CREATE
post '/tracker/view/transaction' do
  @budget = Budget.all().first
  @transaction = Transaction.new(params)
  @transaction.save()
  @budget.total -= @transaction.amount
  @budget.update()
  redirect '/tracker'
end

#EDIT
get '/tracker/edit/transaction/:id' do
  @merchants = Merchant.all()
  @categories = Category.all()
  @transaction = Transaction.find(params[:id])
  erb(:"transactions/edit_transaction")
end

#UPDATE
post '/tracker/view/transaction/:id' do
  @transaction = Transaction.new(params)
  @transaction.update()
  redirect '/tracker/view/transaction'
end


#DELETE
post '/tracker/delete/transaction/:id' do
  @transaction = Transaction.find(params[:id])
  @transaction.delete()
  redirect '/tracker/view/transaction'
end


#DELETE ALL
post '/tracker/delete/transaction/all' do
  Transaction.delete_all()
  redirect '/tracker/view/transaction'
end


#ORDER TRANSACTIONS by DATE
get '/tracker/view/transaction/descending' do
  @transactions = Transaction.order_descending
  erb(:"transactions/index_transaction")
end

#ORDER TRANSACTIONS by DATE
get '/tracker/view/transaction/ascending' do
  @transactions = Transaction.order_ascending
  erb(:"transactions/index_transaction")
end
