class CreateJoinTableFaunasPredators < ActiveRecord::Migration[7.0]
  def change
    t.references :fauna_id, null: false, foreign_key: true
    t.references :predator_id, null: false, foreign_key: true
  end
end
