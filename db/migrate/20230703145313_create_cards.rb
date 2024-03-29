class CreateCards < ActiveRecord::Migration[7.0]
  def change
    create_table :cards do |t|
      t.string :name
      t.text :description
      t.text :note
      t.references :typeable, polymorphic: true

      t.timestamps
    end

    add_index :cards, [:typeable_type, :typeable_id], unique: true

  end
end
