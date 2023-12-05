# frozen_string_literal: true

class AdditemrIdToCategories < ActiveRecord::Migration[7.1]
  def change
    add_reference :payments, :item, null: false, foreign_key: true
    add_reference :payments, :category, null: false, foreign_key: true
  end
end
