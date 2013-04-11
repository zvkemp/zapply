class AddAppConfirmationSentToUsers < ActiveRecord::Migration
  def change
    add_column :users, :application_confirmation_sent, :boolean, default: false
  end
end
