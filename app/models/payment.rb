# frozen_string_literal: true

class Payment < ApplicationRecord
  belongs_to :item
  belongs_to :category
end
