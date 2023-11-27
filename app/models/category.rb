class Category < ApplicationRecord
    has_many :payments, dependent: :destroy
    has_many :items, through: :payments
end
