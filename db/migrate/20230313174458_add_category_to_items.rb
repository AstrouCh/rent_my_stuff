class AddCategoryToItems < ActiveRecord::Migration[7.0]
  def change
    add_reference :items, :category, foreign_key: true
  end
end
