class Order < ApplicationRecord

    has_and_belongs_to_many :products
    belongs_to :user
    has_many :carts, dependent: :delete_all
    enum status: {"pending" => "pending", "completed" => "completed"}
end
