class CreateFaunas < ActiveRecord::Migration[7.0]
  def change
    create_table :faunas do |t|
      t.references :animal_scientific_order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
