class Product < ApplicationRecord
    belongs_to :user
    has_many :rented_products
end
