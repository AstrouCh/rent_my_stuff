class RemoveFavouritesTable < ActiveRecord::Migration[7.0]
  def change
    drop_table :favourites
  end
end
