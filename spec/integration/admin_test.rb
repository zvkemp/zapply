require_relative '../minitest_helper'

describe "Admin functions :: integration" do
  before do
    use_javascript
    login admin_user
  end

  it "is an admin user" do
    @user.admin?.must_equal true
  end


  it "shows the admin link in the navbar" do
    page.text.must_include "admin"
  end
end