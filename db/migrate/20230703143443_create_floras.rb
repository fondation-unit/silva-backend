class CreateFloras < ActiveRecord::Migration[7.0]
  def change
    create_table :floras do |t|
      t.string :associated_species
      t.string :buildup_speed
      t.timestamps
    end
  end
end
