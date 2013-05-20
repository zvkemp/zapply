class AddConsiderationFlagToApplicants < ActiveRecord::Migration
  def change
    add_column :users, :under_consideration, :boolean, default: true
  end
end
