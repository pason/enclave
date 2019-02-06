# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_02_06_214214) do

  create_table "islands", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.bigint "map_id"
    t.index ["map_id"], name: "index_islands_on_map_id"
  end

  create_table "maps", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "dimension_x_axis", null: false
    t.integer "dimension_y_axis"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tiles", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.bigint "map_id"
    t.bigint "island_id"
    t.integer "coordinate_x", null: false
    t.integer "coordinate_y", null: false
    t.integer "role", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["island_id"], name: "index_tiles_on_island_id"
    t.index ["map_id"], name: "index_tiles_on_map_id"
  end

  add_foreign_key "islands", "maps"
  add_foreign_key "tiles", "maps"
end
