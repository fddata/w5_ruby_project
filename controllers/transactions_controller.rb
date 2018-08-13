require 'sinatra'
require 'sinatra/contrib/all'
require 'pry-byebug'

require_relative '../models/category.rb'
require_relative '../models/merchant.rb'
require_relative '../models/transaction.rb'
require_relative '../models/user.rb'

also_reload('models/*')

#INDEX
get '/tracker/view/transaction' do
  @transactions = Transaction.all()
  erb(:"transactions/index_transaction")
end

#SHOW

#NEW
get '/tracker/new/transaction' do
  @user = User.all().first
  @merchants = Merchant.all()
  @categories = Category.all()
  erb(:"transactions/new_transaction")
end

#CREATE
post '/tracker/view/transaction' do
  @transaction = Transaction.new(params)
  @transaction.save()
  redirect '/tracker/view/transaction'
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
