class CreateTiles < ActiveRecord::Migration[5.2]
  def change
    create_table :tiles do |t|
      t.references :map, foreign_key: true
      t.references :island, null: true
      t.integer :coordinate_x, null: false
      t.integer :coordinate_y, null: false
      t.integer :role, null: false
      t.timestamps
    end
  end
end
