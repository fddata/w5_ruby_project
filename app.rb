puts "This is process #{Process.pid}"
require( 'sinatra' )
require( 'sinatra/contrib/all' )

require_relative('controllers/transactions_controller')
require_relative('controllers/categories_controller')
require_relative('controllers/merchants_controller')
require_relative('models/budget.rb')

also_reload('models/*')


helpers do
  def budget_check
    @budget = Budget.all().first
    if @budget.total < 20
      'style="color:red;"'
    elsif @budget.total < 50
      'style="color:orange;"'
    end
  end
end



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
