class Product < ApplicationRecord

    belongs_to :category
    has_one_attached :avatar
    has_many :carts, dependent: :delete_all

    has_and_belongs_to_many :orders
    
end
