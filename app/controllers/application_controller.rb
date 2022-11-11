class ApplicationController < Sinatra::Base
    set :default_content_type, "application/json"
    # get '/' do # this is the root route of the application (the homepage) but you can have as many routes as you want
    #     {hello: "Just a starting code 😃"}.to_json
    # end

    before do
        response.headers["Access-Control-Allow-Origin"] = "*"
    end

     # enable CORS preflight requests
    options "*" do
        response.headers["Access-Control-Allow-Methods"] = "GET, POST, PUT, PATCH, DELETE, OPTIONS"
    end

    set :default_content_type, "application/json"
    # get '/' do # this is the root route of the application (the homepage) but you can have as many routes as you want
    #     {hello: "Just a starting code 😃"}.to_json
    # end

    before do
        response.headers["Access-Control-Allow-Origin"] = "*"
    end

     # enable CORS preflight requests
    options "*" do
        response.headers["Access-Control-Allow-Methods"] = "GET, POST, PUT, PATCH, DELETE, OPTIONS"
    end

# Get all customers
    get '/customers' do 
       customers = Customer.all
       customers.to_json
    end
# Find by id
    get '/customers/:id' do
        params[:id]
        customer_id = Customer.find(params[:id])
        customer_id.to_json
    end

    # Delete by id
    delete '/customers/:id' do
        customer_delete = Customer.find(params[:id])
        customer_delete.destroy.to_json
    end

    # Meals
    get '/meals' do 
        Meal.all.limit(8).to_json
    end
    

end