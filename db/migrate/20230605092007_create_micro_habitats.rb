class CreateMicroHabitats < ActiveRecord::Migration[7.0]
  def change
    create_table :micro_habitats do |t|
      t.string :name

      t.timestamps
    end
  end
end
