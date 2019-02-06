class CreateIslands < ActiveRecord::Migration[5.2]
  def change
    create_table :islands do |t|
      t.references :map, foreign_key: true
    end
  end
end
