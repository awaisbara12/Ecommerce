class Category < ApplicationRecord

    has_many :products
    has_one_attached :avatar
    has_many :carts
end
