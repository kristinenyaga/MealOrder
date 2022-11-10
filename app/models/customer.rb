class Customer < ActiveRecord::Base
  has_many :orders
  has_many :meals, through: :orders
end