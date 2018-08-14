puts "This is process #{Process.pid}"
require( 'sinatra' )
require( 'sinatra/contrib/all' )

require_relative('controllers/transactions_controller')
require_relative('controllers/categories_controller')
require_relative('controllers/merchants_controller')
require_relative('models/budget.rb')

also_reload('models/*')

get '/tracker' do
  @transaction = Transaction.order_descending.first
  @budget = Budget.all().first
    erb( :index )
end

post '/tracker/:id' do
  @budget= Budget.new(params)
  @budget.update()
  redirect '/tracker'
end
