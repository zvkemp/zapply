class AddDormantFlagToUsers < ActiveRecord::Migration
  def change
    add_column :users, :dormant, :boolean, default: false
  end
end
