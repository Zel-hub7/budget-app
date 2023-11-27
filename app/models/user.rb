class User < ApplicationRecord
    has_many :categories, dependent: :destroy
    has_many :items, dependent: :destroy
    def index

    end
end
