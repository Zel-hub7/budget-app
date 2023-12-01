class Category < ApplicationRecord
    belongs_to :user
    has_many :payments, dependent: :destroy
    has_many :items, through: :payments

    def total_price
        items.sum(:amount)
    end
end
