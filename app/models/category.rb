class Category < ApplicationRecord
    belongs_to :user
    has_many :payments, dependent: :destroy
    has_many :items, through: :payments

    validates :name, :icon, presence: true

    def total_price
        items.sum(:amount)
    end

    ICONS = {
        'House Hold' => 'https://cdn-icons-png.flaticon.com/128/2544/2544087.png',
        'Foods' => 'https://cdn-icons-png.flaticon.com/128/706/706164.png',
        'Transportation' => 'https://cdn-icons-png.flaticon.com/128/575/575780.png',
        'Utilities' => 'https://cdn-icons-png.flaticon.com/128/10219/10219659.png',
        'Medical and Health Care' => 'https://cdn-icons-png.flaticon.com/128/4807/4807695.png'
      }.freeze
end
