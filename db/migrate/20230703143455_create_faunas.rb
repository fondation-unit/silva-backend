class CreateFaunas < ActiveRecord::Migration[7.0]
  def change
    create_table :faunas do |t|
      t.string :scientific_class
      t.string :habitat
      t.string :micro_habitat
      t.string :predator
      t.timestamps
    end
  end
end
