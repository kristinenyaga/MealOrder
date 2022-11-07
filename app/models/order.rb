class Order < ActiveRecord::Base
  belongs_to :meals
  belongs_to :customer
end