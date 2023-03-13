class RemoveColumnFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :items, :availability
  end
end
