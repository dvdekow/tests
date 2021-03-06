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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130905045417) do

  create_table "algo_ones", :force => true do |t|
    t.integer  "total_view"
    t.integer  "total_click"
    t.integer  "total_buy"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "algo_twos", :force => true do |t|
    t.integer  "total_view"
    t.integer  "total_click"
    t.integer  "total_buy"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "algos", :force => true do |t|
    t.integer  "product_view"
    t.integer  "recommendation_clicked"
    t.integer  "recommendation_bought"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.float    "efficiency"
  end

  create_table "responses", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.float    "duration"
  end

  create_table "tests", :force => true do |t|
    t.string   "listen"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "product"
    t.string   "user"
    t.string   "algo"
  end

end
