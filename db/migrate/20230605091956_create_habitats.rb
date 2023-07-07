class CreateHabitats < ActiveRecord::Migration[7.0]
  def change
    create_table :habitats do |t|
      t.string :name

      t.timestamps
    end
  end
end
