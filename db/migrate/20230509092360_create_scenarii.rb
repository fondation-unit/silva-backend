class CreateScenarii < ActiveRecord::Migration[7.0]
  def change
    create_table :scenarii do |t|
      t.string :author
      t.string :name
      t.integer :level
      t.string :subject
      t.text :description

      t.timestamps
    end
  end
end
