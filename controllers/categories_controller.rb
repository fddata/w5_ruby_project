require 'sinatra'
require 'sinatra/contrib/all'
require 'pry-byebug'

require_relative '../models/category.rb'
require_relative '../models/merchant.rb'
require_relative '../models/transaction.rb'
require_relative '../models/user.rb'

also_reload('models/*')

#INDEX
get '/tracker/view/category' do
  @transactions = Transaction.all()
  @categories = Category.all()
  erb(:"categories/index_category")
end

#SHOW

#NEW
get '/tracker/new/category' do
  @categories = Category.all()
  erb(:"categories/new_category")
end

#CREATE
post '/tracker/view/category' do
  @category = Category.new(params)
  @category.save()
  redirect '/tracker/view/category'
end


#EDIT
get '/tracker/edit/category/:id' do
  @category = Category.find(params[:id])
  erb(:"categories/edit_category")
end

#UPDATE
post '/tracker/view/category/:id' do
  @category = Category.new(params)
  @category.update()
  redirect '/tracker/view/category'
end

#DELETE
post '/tracker/delete/category/:id' do
  @category = Category.find(params[:id])
  @category.delete()
  redirect '/tracker/view/category'
end
