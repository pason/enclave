class CreateMaps < ActiveRecord::Migration[5.2]
  def change
    create_table :maps do |t|
      t.integer :dimension_x_axis, null: false
      t.integer :dimension_y_axis, null: false
      t.timestamps
    end
  end
end
