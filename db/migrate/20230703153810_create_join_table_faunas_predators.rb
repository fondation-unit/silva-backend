class CreateJoinTableFaunasPredators < ActiveRecord::Migration[7.0]
  def change
    create_table :faunas_predators do |t|
      t.references :fauna, foreign_key: true
      t.references :predator, foreign_key: {to_table: :faunas}
    end
  end
end
