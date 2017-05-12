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

ActiveRecord::Schema.define(version: 20170512085113) do

  create_table "addresses", force: :cascade do |t|
    t.integer  "customer_id"
    t.string   "name"
    t.string   "street"
    t.string   "country"
    t.string   "province"
    t.string   "city"
    t.string   "postal_code"
    t.string   "phone"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["customer_id"], name: "index_addresses_on_customer_id"
  end

  create_table "catalog_hierarchies", id: false, force: :cascade do |t|
    t.integer "ancestor_id",   null: false
    t.integer "descendant_id", null: false
    t.integer "generations",   null: false
    t.index ["ancestor_id", "descendant_id", "generations"], name: "catalog_anc_desc_idx", unique: true
    t.index ["descendant_id"], name: "catalog_desc_idx"
  end

  create_table "catalogs", force: :cascade do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_id"], name: "index_catalogs_on_parent_id"
  end

  create_table "customers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "listing_item_components", force: :cascade do |t|
    t.integer "listing_item_id"
    t.integer "stock_keeping_unit_id"
    t.integer "quantity"
    t.index ["listing_item_id"], name: "index_listing_item_components_on_listing_item_id"
    t.index ["stock_keeping_unit_id"], name: "index_listing_item_components_on_stock_keeping_unit_id"
  end

  create_table "listing_items", force: :cascade do |t|
    t.string   "name"
    t.integer  "listing_id"
    t.decimal  "price",      precision: 8, scale: 2
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.index ["listing_id"], name: "index_listing_items_on_listing_id"
  end

  create_table "listings", force: :cascade do |t|
    t.string   "name"
    t.text     "introduction"
    t.integer  "catalog_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["catalog_id"], name: "index_listings_on_catalog_id"
  end

  create_table "order_addresses", force: :cascade do |t|
    t.integer  "order_id"
    t.string   "name"
    t.string   "street"
    t.string   "country"
    t.string   "province"
    t.string   "city"
    t.string   "postal_code"
    t.string   "phone"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "type"
    t.index ["order_id"], name: "index_order_addresses_on_order_id"
  end

  create_table "order_items", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "listing_item_id"
    t.integer  "quantity"
    t.decimal  "unit_price",      precision: 8, scale: 2
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.index ["order_id"], name: "index_order_items_on_order_id"
  end

  create_table "order_payments", force: :cascade do |t|
    t.integer  "order_id"
    t.boolean  "success"
    t.string   "description"
    t.decimal  "amount",      precision: 8, scale: 2
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["order_id"], name: "index_order_payments_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.decimal  "item_total",    precision: 8, scale: 2
    t.decimal  "shipping_cost", precision: 8, scale: 2
    t.decimal  "total",         precision: 8, scale: 2
    t.integer  "customer_id"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.index ["customer_id"], name: "index_orders_on_customer_id"
  end

  create_table "package_items", force: :cascade do |t|
    t.integer  "stock_keeping_unit_id"
    t.integer  "package_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "quantity"
    t.index ["package_id"], name: "index_package_items_on_package_id"
  end

  create_table "packages", force: :cascade do |t|
    t.integer  "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_packages_on_order_id"
  end

  create_table "stock_items", force: :cascade do |t|
    t.integer  "warehouse_id"
    t.integer  "stock_keeping_unit_id"
    t.integer  "on_hand"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["stock_keeping_unit_id", "warehouse_id"], name: "index_stock_items_on_stock_keeping_unit_id_and_warehouse_id"
  end

  create_table "stock_keeping_units", force: :cascade do |t|
    t.string   "name"
    t.string   "model"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "warehouses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
