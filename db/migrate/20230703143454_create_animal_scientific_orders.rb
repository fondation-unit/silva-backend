class CreateAnimalScientificOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :animal_scientific_orders do |t|
      t.string :name

      t.timestamps
    end
  end
end
