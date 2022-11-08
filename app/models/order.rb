class Order < ActiveRecord::Base
  belongs_to :meal
  belongs_to :customer
end