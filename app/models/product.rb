class Product < ApplicationRecord

    belongs_to :category
    has_one_attached :avatar
    has_many :carts, dependent: :delete_all
    
end
