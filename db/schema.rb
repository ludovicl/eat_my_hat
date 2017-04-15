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

ActiveRecord::Schema.define(version: 20170218101137) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.integer  "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_cities_on_country_id", using: :btree
    t.index ["name", "country_id"], name: "city_unique_index", unique: true, using: :btree
    t.index ["name"], name: "index_cities_on_name", using: :btree
  end

  create_table "countries", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_countries_on_name", unique: true, using: :btree
  end

  create_table "place_place_types", force: :cascade do |t|
    t.integer  "place_type_id"
    t.integer  "place_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["place_id", "place_type_id"], name: "unique_place_place_types", unique: true, using: :btree
    t.index ["place_id"], name: "index_place_place_types_on_place_id", using: :btree
    t.index ["place_type_id"], name: "index_place_place_types_on_place_type_id", using: :btree
  end

  create_table "place_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "unique_place_types_index", unique: true, using: :btree
  end

  create_table "places", force: :cascade do |t|
    t.string    "name"
    t.string    "website"
    t.string    "map_link"
    t.geography "lonlat",     limit: {:srid=>4326, :type=>"point", :geographic=>true}
    t.integer   "street_id"
    t.datetime  "created_at",                                                          null: false
    t.datetime  "updated_at",                                                          null: false
    t.index ["lonlat"], name: "index_places_on_lonlat", using: :btree
    t.index ["map_link"], name: "index_places_on_map_link", using: :btree
    t.index ["name", "street_id"], name: "place_unique_index", unique: true, using: :btree
    t.index ["name"], name: "index_places_on_name", using: :btree
    t.index ["street_id"], name: "index_places_on_street_id", using: :btree
    t.index ["website"], name: "index_places_on_website", using: :btree
  end

  create_table "reviews", force: :cascade do |t|
    t.string   "name"
    t.string   "link"
    t.integer  "place_id"
    t.integer  "website_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["link"], name: "index_reviews_on_link", using: :btree
    t.index ["name", "link", "place_id", "website_id"], name: "unique_reviews_index", unique: true, using: :btree
    t.index ["name"], name: "index_reviews_on_name", using: :btree
    t.index ["place_id"], name: "index_reviews_on_place_id", using: :btree
    t.index ["website_id"], name: "index_reviews_on_website_id", using: :btree
  end

  create_table "streets", force: :cascade do |t|
    t.string   "name"
    t.integer  "zipcode_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "zipcode_id"], name: "street_unique_index", unique: true, using: :btree
    t.index ["name"], name: "index_streets_on_name", using: :btree
    t.index ["zipcode_id"], name: "index_streets_on_zipcode_id", using: :btree
  end

  create_table "websites", force: :cascade do |t|
    t.string   "name"
    t.string   "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["link"], name: "index_websites_on_link", using: :btree
    t.index ["name"], name: "index_websites_on_name", unique: true, using: :btree
  end

  create_table "zipcodes", force: :cascade do |t|
    t.string   "name"
    t.integer  "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_zipcodes_on_city_id", using: :btree
    t.index ["name", "city_id"], name: "zipcode_unique_index", unique: true, using: :btree
    t.index ["name"], name: "index_zipcodes_on_name", using: :btree
  end

  add_foreign_key "cities", "countries"
  add_foreign_key "place_place_types", "place_types"
  add_foreign_key "place_place_types", "places"
  add_foreign_key "places", "streets"
  add_foreign_key "reviews", "places"
  add_foreign_key "reviews", "websites"
  add_foreign_key "streets", "zipcodes"
  add_foreign_key "zipcodes", "cities"
end
