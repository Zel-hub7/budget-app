class AddAuthorIdToItems < ActiveRecord::Migration[7.1]
  def change
    add_reference :items, :author, foreign_key: { to_table: :users }
  end
end
