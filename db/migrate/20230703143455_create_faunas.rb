class CreateFaunas < ActiveRecord::Migration[7.0]
  def change
    create_table :faunas do |t|
      t.references :animal_scientific_order, foreign_key: { to_table: :animal_scientific_orders }
      t.string :habitat
      t.string :micro_habitat
      t.string :predator
      t.timestamps
    end
  end
end
