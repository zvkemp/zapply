require_relative "../minitest_helper"

describe "The landing page :: integration" do
  before do
    use_javascript
    visit root_path
  end

  describe "not logged in" do
    it "shows the job description" do
      page.text.must_include "Program Manager"
    end

    it "shows an apply now button" do
      page.text.must_include "Apply Now"
    end

    it "shows a sign in link" do
      page.text.must_include "sign in"
    end

    it "shows a sign up link" do
      page.text.must_include "sign up"
    end
  end
end