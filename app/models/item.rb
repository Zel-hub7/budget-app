# frozen_string_literal: true

class Item < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :payments, dependent: :destroy
  has_many :categories, through: :payments
end
