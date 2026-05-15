class CreateStocks < ActiveRecord::Migration[7.1]
  def change
    create_table :stocks do |t|
      t.references :user, null: false, foreign_key: true
      t.references :vegetable, null: false, foreign_key: true
      t.date :purchased_on
      t.integer :status

      t.timestamps
    end
  end
end
