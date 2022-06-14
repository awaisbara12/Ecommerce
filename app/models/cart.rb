class Cart < ApplicationRecord
    belongs_to :product ,:dependent => :destroy
end
