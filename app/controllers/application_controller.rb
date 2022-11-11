class ApplicationController < Sinatra::Base
    set :default_content_type,"application/json"

    # allow access-control-allow-origin header on all requests
    before do
        response.headers["Access-Control-Allow-Origin"] = "*"
    end

    # enable CORS preflight requests
    options "*" do
        response.headers["Access-Control-Allow-Methods"] = "GET, POST, PUT, PATCH, DELETE, OPTIONS"
    end
    get '/' do # this is the root route of the application (the homepage) but you can have as many routes as you want
        {hello: "Just a starting code 😃"}.to_json
    end

    get '/customers' do
        Customer.all.to_json
    end

    get '/customer/:id' do
        Customer.find(params[:id]).to_json
    end

    post '/customer' do
        customer = Customer.create(
            name: params[:name]
        )
        customer.to_json
    end

    get '/meals' do 
        Meal.all.limit(10).to_json
    end

    get '/meal/:id' do
        Meal.find(params[:id]).to_json
    end

    get '/meals/cuisine/:cuisine' do
        Meal.find_by(cuisine: params[:cuisine]).to_json
    end
    get '/meals/name/:name' do
        Meal.find_by(name: params[:name]).to_json
    end

    # get '/meal/most_expensive' do
    #     expensive_meal = Meal.all.order(:price).first
    #     expensive_meal.to_json
    #   end

    get '/meals/price' do
        Meal.all.order(:price).to_json
    end

    get '/restaurants' do
        Meal.all.to_json(only: [:restaurant])
    end

    get '/cuisines' do
        Meal.all.to_json(only: [:cuisine])
    end

    get '/meals/most_expensive' do
        meal=Meal.all.order('price DESC').first
        meal.to_json
    end

     get '/meals/cheapest' do
         meal=Meal.all.order('price DESC').last
        meal.to_json
     end
    
    get '/order/:id' do
        Order.find(params[:id]).to_json(include: :meal)
    end

    get '/order/:order_number' do
        order=Order.find_by(order_number: params[:order_number])
        order.to_json(include: :customer)
    end
  
#    post '/orders' do
#     order = Order.create(
#             order_number: params[:title],
#             customer_id: params[:customer_id],
#             meal_id: params[:meal_id],
#         )
#         order.to_json
#    end

    post '/meal' do
        meal = Meal.create(
            image: params[:image],
            name: params[:name],
            price: params[:price],
            cuisine: params[:cuisine],
            restaurant: params[:restaurant]
        )
        meal.to_json
    end

end
