require 'sinatra'
require 'sinatra/contrib/all'
require 'pry-byebug'

require_relative '../models/category.rb'
require_relative '../models/merchant.rb'
require_relative '../models/transaction.rb'
require_relative '../models/user.rb'

also_reload('models/*')


#INDEX
get '/tracker/view/merchant' do
  @transactions = Transaction.all()
  @merchants = Merchant.all()
  erb(:"merchants/index_merchant")
end

#SHOW

#NEW
get '/tracker/new/merchant' do
  @merchants = Merchant.all()
  erb(:"merchants/new_merchant")
end

#CREATE
post '/tracker/view/merchant' do
  @merchant = Merchant.new(params)
  @merchant.save()
  redirect '/tracker/view/merchant'
end

#EDIT
get '/tracker/edit/merchant/:id' do
  @merchant = Merchant.find(params[:id])
  erb(:"merchants/edit_merchant")
end

#UPDATE
post '/tracker/view/merchant/:id' do
  @merchant = Merchant.new(params)
  @merchant.update()
  redirect '/tracker/view/merchant'
end

#DELETE
post '/tracker/delete/merchant/:id' do
  @merchant = Merchant.find(params[:id])
  @merchant.delete()
  redirect '/tracker/view/merchant'
end
