class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :title
      t.text :location
      t.text :description
      t.date :availability
      t.decimal :average_rating
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
