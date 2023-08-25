# frozen_string_literal: true

class AddUsernameToVendors < ActiveRecord::Migration[7.0]
  def change
    add_column :vendors, :username, :string
    add_index :vendors, :username, unique: true
  end
end
