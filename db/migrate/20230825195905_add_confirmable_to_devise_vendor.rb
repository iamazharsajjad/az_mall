# frozen_string_literal: true

class AddConfirmableToDeviseVendor < ActiveRecord::Migration[7.0]
  def up
    add_column :vendors, :confirmation_token, :string
    add_column :vendors, :confirmed_at, :datetime
    add_column :vendors, :confirmation_sent_at, :datetime
    # add_column :vendors, :unconfirmed_email, :string # Only if using reconfirmable
    add_index :vendors, :confirmation_token, unique: true
    # User.reset_column_information # Need for some types of updates, but not for update_all.
    # To avoid a short time window between running the migration and updating all existing
    # vendors as confirmed, do the following
    Vendor.update_all confirmed_at: DateTime.now
    # All existing user accounts should be able to log in after this.
  end

  def down
    remove_index :vendors, :confirmation_token
    remove_columns :vendors, :confirmation_token, :confirmed_at, :confirmation_sent_at
    # remove_columns :vendors, :unconfirmed_email # Only if using reconfirmable
  end
end
