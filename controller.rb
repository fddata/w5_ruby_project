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
#
# post '/pizza-orders/:id' do
#   order = PizzaOrder.new(params)
#   order.update()
#   redirect "/pizza-orders/#{order.id}"
# end



# get '/pizza-orders/:id' do
#   @order = PizzaOrder.find(params[:id])
#   erb(:show)
# end

#
# #EDIT
# #edit is accessed via a href button on the show.erb.
# get '/pizza-orders/:id/edit' do
#   @order = PizzaOrder.find(params[:id])
#   erb(:edit)
# end
#
# #UPDATE - we are redirected here from the erb(:edit) above.
# #We create a new order with the params passed from the Edit form.
# #Uses the exiting id too.
# #Once updated we go back to the SHOW (get) route.
# post '/pizza-orders/:id' do
#   order = PizzaOrder.new(params)
#   order.update()
#   redirect "/pizza-orders/#{order.id}"
# end
