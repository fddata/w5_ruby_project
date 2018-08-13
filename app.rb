require( 'sinatra' )
require( 'sinatra/contrib/all' )

require_relative('controllers/transactions_controller')
require_relative('controllers/categories_controller')
require_relative('controllers/merchants_controller')

get '/tracker' do
  @user= User.all().first
  erb( :index )
end
