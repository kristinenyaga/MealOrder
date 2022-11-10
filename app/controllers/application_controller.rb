class ApplicationController < Sinatra::Base
    set :default_content_type,"application/json"

    before do
        response.headers['Access-Control-Allow-Origin'] = "*"
    end


    get '/' do # this is the root route of the application (the homepage) but you can have as many routes as you want
        {hello: " We are group 6😃"}.to_json
    end

    #have a list of all the customers
    get '/customer' do
        Customer.all.to_json
    end

    #returns a specific customer
    # get '/customer/:id' do
    #     params[:id]
    #     Customer.find(params[:id]).to_json
    # end

    #Lets get a full list of meals
    get '/meal' do
        Meal.all.to_json
    end
    
    
    #Let;s get a specific meal
    get '/meal/:id' do
        params[:id]
        Meal.find(params[:id]).to_json
    end

    #A list of all the orders
    get '/order' do
        Order.all.to_json
    end

    #A specific order
    # get '/order/:id' do
    #     params[:id]
    #     Order.find(params[:id]).to_json
    # end

    get '/order/:id' do
        Order.find(params[:id]).to_json(include: :meal)
    end

    get '/order/customer_name' do
        Order.find_by(name: params[:name]).to_json
    end

    #Creating an order
    post '/order' do
        order = Order.create(
            order_number: params[:order_number],
            customer_id: params[:customer_id],
            meal_id: params[:meal_id],
            status: false,
        )
        order.to_json
    end


    #Deleting an order
    delete '/order/:id' do
        order = Order.find(params[:id])
        order.destroy
        {message: "Your order has been deleted"}.to_json
    end

    get '/customer/:id' do
    customer = Customer.find(params[:id])

    customer.to_json(only: [:name], include: {
        meals: { only: [:name] }
    })
        end


    
end


