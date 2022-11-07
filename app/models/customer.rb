class Customer < ActiveRecord::Base
  has_many :order
  has_many :meals, through: :orders
end