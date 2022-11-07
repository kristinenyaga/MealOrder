puts "🌱 Seeding data..."
Customer.destroy_all
Meal.destroy_all

# place your seeds here


15.times do
    Customer.create(name: Faker::Name.name)
  end
  
  # Make 30 meals
  30.times do
    # create a meal with random data
    Meal.create(
    image: "https://images.unsplash.com/photo-1600335895229-6e75511892c8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8bWVhbHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60",
    name: Faker::Food.dish,
    cuisine: Faker::Food.ethnic_category,
    restaurant: Faker::Restaurant.name,
    price: rand(1500..2500)
    )
  end

#     Meal.all.each do |meal|
#     # create between 1 and 5 orders for each meal
#     3.times do
#       # get a random customer for every order
#       customer = Customer.order('RANDOM()').first
  
#       # A order belongs to a meal and a customer, so we must provide those foreign keys
#       Order.create(
#         order_number: Faker::Alphanumeric.alphanumeric(number: 5),
#         meal_id: meal.id,
#         customer_id: customer.id
#       )
#     end
# end

  
  
puts "🌱 Done seeding!"
