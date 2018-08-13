require( 'sinatra' )
require( 'sinatra/contrib/all' )

require_relative('controllers/transactions_controller')
require_relative('controllers/categories_controller')
require_relative('controllers/merchants_controller')
require_relative('models/budget.rb')

also_reload('models/*')

get '/tracker' do
  @budget = Budget.all().first
    erb( :index )
end

post '/tracker/:id' do
  @budget= Budget.new(params)
  @budget.update()
  redirect '/tracker'
end
