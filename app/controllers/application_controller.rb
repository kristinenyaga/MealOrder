class ApplicationController < Sinatra::Base
    set :default_content_type,"application/json"
    get '/' do # this is the root route of the application (the homepage) but you can have as many routes as you want
        {hello: "Just a starting code 😃"}.to_json
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

# Update Customers
    patch '/customer/:id' do 
        customer_update = Customer.find(params[:id])
        customer_update.update(
            name: params[:title]
            status: true,
            {message: "To Do List Updated"}.to_json
        )
    end


    # Delete by id
    delete '/customers/:id' do
        customer_delete = Customer.find(params[:id])
        customer_delete.:destroy.to_json
    end

end