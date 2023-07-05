class CreateFaunaHabitats < ActiveRecord::Migration[7.0]
  def change
    create_table :fauna_habitats do |t|
      t.references :fauna, null: false, foreign_key: true
      t.references :habitat, null: false, foreign_key: true

      t.timestamps
    end
  end
end
