class CreateCards < ActiveRecord::Migration[7.0]
  def change
    create_table :cards do |t|
      t.string :name
      t.text :description
      t.references :typeable, polymorphic: true
      t.timestamps

      # polymorphic
      t.bigint  :typeable_id
      t.string  :typeable_type
    end
  end
end
