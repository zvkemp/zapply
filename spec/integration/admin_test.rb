require_relative '../minitest_helper'

# describe "Admin functions :: integration" do
#   before do
#     FactoryGirl.create(:user, email: "zvaughank@gmail.com", submitted: true, name: "Zach Kemp")
#     FactoryGirl.create(:user, email: "zach@wolfbrown.com", submitted: true, name: "Wolf Brown")
#     use_javascript
#     login admin_user
#   end

#   it "is an admin user" do
#     @user.admin?.must_equal true
#   end

#   it "shows the admin link in the navbar" do
#     page.text.must_include "ADMIN"
#   end

#   describe "list of applicants" do
#     it "lists the applicants" do
#       click_on 'ADMIN'
#       page.text.must_include 'zvaughank'
#       page.text.must_include 'zvkemp'
#     end
#   end

#   describe "showing applicants" do
#     click_on 'ADMIN'
#     click_on 'Zach Kemp'
#     page.text.must_include 'Zach Kemp'
#     page.text.must_include 'Rating categories:'
#   end


# end