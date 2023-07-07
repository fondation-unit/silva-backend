class CreateFlorasSpecies < ActiveRecord::Migration[7.0]
  def change
    create_table :floras_species do |t|
      t.references :flora, null: false, foreign_key: true
      t.references :species, null: false, foreign_key: true

      t.timestamps
    end
  end
end
