class CreatePlans < ActiveRecord::Migration[5.2]
  def change
    create_table :plans do |t|
      t.string :country, null: false
      t.string :name, null: false
      t.string :description, null: false
      t.integer :price_hundredths, null: false
      t.string :currency, null: false

      t.timestamps null: false

      t.index [:country]
    end
  end
end
