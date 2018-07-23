class BreakoutCountry < ActiveRecord::Migration[5.2]
  def up
    create_table :countries, id: false do |t|
      t.string :id, null: false, primary_key: true
      t.string :currency, null: false

      t.timestamps null: false
    end

    remove_column :plans, :country
    remove_column :plans, :currency

    add_reference :plans, :countries, type: :string, index: true, foreign_key: true
  end

  def down
    remove_reference :plans, :countries

    add_column :plans, :country, :string, null: false, default: ''
    add_column :plans, :currency, :string, null: false, default: ''

    drop_table :countries
  end
end
