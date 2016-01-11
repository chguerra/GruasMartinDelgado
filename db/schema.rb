# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160111161426) do

  create_table "clients", force: :cascade do |t|
    t.string   "name"
    t.string   "street"
    t.string   "street_number"
    t.string   "city"
    t.integer  "postal_code"
    t.string   "phone"
    t.string   "email"
    t.string   "contact_person"
    t.string   "observations"
    t.string   "payment_method"
    t.string   "nif"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "deliveries", force: :cascade do |t|
    t.float    "price"
    t.date     "delivery_date"
    t.string   "delivery_status",       default: "PENDIENTE"
    t.string   "observations"
    t.integer  "origin"
    t.integer  "destination"
    t.integer  "client_id"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.integer  "vehicle"
    t.integer  "driver"
    t.integer  "truck"
    t.float    "driver_price"
    t.string   "filepath"
    t.string   "document_file_name"
    t.string   "document_content_type"
    t.integer  "document_file_size"
    t.datetime "document_updated_at"
    t.string   "payment_method"
    t.date     "payment_date"
    t.string   "payment_status",        default: "PENDIENTE"
  end

  add_index "deliveries", ["client_id"], name: "index_deliveries_on_client_id"

  create_table "drivers", force: :cascade do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "address"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "places", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "address_details"
    t.string   "postal_code"
    t.string   "city"
    t.string   "phone"
    t.string   "contact_person"
    t.integer  "delivery_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "places", ["delivery_id"], name: "index_places_on_delivery_id"

  create_table "trucks", force: :cascade do |t|
    t.string   "matricula"
    t.string   "modelo"
    t.string   "marca"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vehicles", force: :cascade do |t|
    t.string   "bastidor_matricula"
    t.string   "model"
    t.string   "brand"
    t.string   "observations"
    t.integer  "delivery_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "vehicles", ["delivery_id"], name: "index_vehicles_on_delivery_id"

end
