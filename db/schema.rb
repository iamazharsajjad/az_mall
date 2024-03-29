# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

# rubocop:disable Metrics/BlockLength

ActiveRecord::Schema[7.0].define(version: 20_230_831_084_001) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'carts', force: :cascade do |t|
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'categories', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'orderables', force: :cascade do |t|
    t.bigint 'product_id', null: false
    t.bigint 'cart_id', null: false
    t.integer 'quantity'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['cart_id'], name: 'index_orderables_on_cart_id'
    t.index ['product_id'], name: 'index_orderables_on_product_id'
  end

  create_table 'product_categories', force: :cascade do |t|
    t.bigint 'product_id', null: false
    t.bigint 'category_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['category_id'], name: 'index_product_categories_on_category_id'
    t.index ['product_id'], name: 'index_product_categories_on_product_id'
  end

  create_table 'products', force: :cascade do |t|
    t.string 'title'
    t.text 'description'
    t.float 'price'
    t.string 'currency'
    t.bigint 'vendor_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['vendor_id'], name: 'index_products_on_vendor_id'
  end

  create_table 'vendors', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'username'
    t.string 'confirmation_token'
    t.datetime 'confirmed_at'
    t.datetime 'confirmation_sent_at'
    t.index ['confirmation_token'], name: 'index_vendors_on_confirmation_token', unique: true
    t.index ['email'], name: 'index_vendors_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_vendors_on_reset_password_token', unique: true
    t.index ['username'], name: 'index_vendors_on_username', unique: true
  end

  add_foreign_key 'orderables', 'carts'
  add_foreign_key 'orderables', 'products'
  add_foreign_key 'product_categories', 'categories'
  add_foreign_key 'product_categories', 'products'
  add_foreign_key 'products', 'vendors'
end
# rubocop:enable Metrics/BlockLength
