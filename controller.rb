require 'sinatra'
require 'sinatra/contrib/all'
require 'pry-byebug'

require_relative 'models/category.rb'
require_relative 'models/merchant.rb'
require_relative 'models/transaction.rb'
require_relative 'models/user.rb'

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

get '/tracker/edit/transaction/:id' do
  @merchants = Merchant.all()
  @categories = Category.all()
  @transaction = Transaction.find(params[:id])
  erb(:edit_transaction)
end

post '/tracker/view/transaction/:id' do
  @transaction = Transaction.new(params)
  @transaction.update()
  redirect '/tracker/view/transaction'
end


get '/tracker/edit/category/:id' do
  @category = Category.find(params[:id])
  erb(:edit_category)
end

post '/tracker/view/category/:id' do
  @category = Category.new(params)
  @category.update()
  redirect '/tracker/view/category'
end

get '/tracker/edit/merchant/:id' do
  @merchant = Merchant.find(params[:id])
  erb(:edit_merchant)
end

post '/tracker/view/merchant/:id' do
  @merchant = Merchant.new(params)
  @merchant.update()
  redirect '/tracker/view/merchant'
end

post '/tracker/delete/transaction/:id' do
  @transaction = Transaction.find(params[:id])
  @transaction.delete()
  redirect '/tracker/view/transaction'
end

post '/tracker/delete/merchant/:id' do
  @merchant = Merchant.find(params[:id])
  @merchant.delete()
  redirect '/tracker/view/merchant'
end

post '/tracker/delete/category/:id' do
  @category = Category.find(params[:id])
  @category.delete()
  redirect '/tracker/view/category'
end

get '/tracker/new/transaction' do
  @user = User.all().first
  @merchants = Merchant.all()
  @categories = Category.all()
  erb(:new_transaction)
end

post '/tracker/view/transaction' do
  @transaction = Transaction.new(params)
  @transaction.save()
  redirect '/tracker/view/transaction'
end


get '/tracker/new/merchant' do
  @merchants = Merchant.all()
  erb(:new_merchant)
end

post '/tracker/view/merchant' do
  @merchant = Merchant.new(params)
  @merchant.save()
  redirect '/tracker/view/merchant'
end


get '/tracker/new/category' do
  @categories = Category.all()
  erb(:new_category)
end

post '/tracker/view/category' do
  @category = Category.new(params)
  @category.save()
  redirect '/tracker/view/category'
end
