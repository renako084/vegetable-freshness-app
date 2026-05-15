class CreateVegetables < ActiveRecord::Migration[7.1]
  def change
    create_table :vegetables do |t|
      t.string :name
      t.integer :shelf_life_days

      t.timestamps
    end
  end
end
