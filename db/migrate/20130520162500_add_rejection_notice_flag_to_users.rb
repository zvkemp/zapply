class AddRejectionNoticeFlagToUsers < ActiveRecord::Migration
  def change
    add_column :users, :rejection_notice_sent, :boolean, default: false
  end
end
