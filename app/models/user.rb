class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: {"admin" => "admin", "user" => "user"}

  has_many :carts, dependent: :delete_all
  has_many :orders, dependent: :delete_all
end
