class CreateFaunasMicroHabitats < ActiveRecord::Migration[7.0]
  def change
    create_table :faunas_micro_habitats do |t|
      t.references :fauna, null: false, foreign_key: true
      t.references :micro_habitat, null: false, foreign_key: true

      t.timestamps
    end
  end
end
