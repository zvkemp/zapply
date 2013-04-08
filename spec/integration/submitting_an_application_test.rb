require_relative '../minitest_helper'

describe "Submitted an application :: integration" do
  before do
    use_javascript
    login
  end

  describe "application is not submitted" do
    before do
      visit root_path
    end

    it "displays the in-progress indicator" do
      find('.navbar').text.must_include "Application In Progress"
    end
  end

  describe "application is submitted" do
    before do
      @user.documents.create(description: "resume")
      @user.documents.create(description: "cover letter")
      @user.submit!
      visit root_path
    end

    it "says thank you" do
      page.text.must_include "Your application has been submitted"
    end

    it "displays submitted status" do
      find('.navbar').text.must_include "Application Submitted"
    end

    it "disables document upload" do
      find('.navbar-inner').click_link "My Documents"
      page.text.must_include "Your application has been submitted."
      page.text.must_include "resume"
      page.text.must_include "cover letter"
      page.text.wont_include "Drag your application documents to this window to upload them"
    end

    it "disables application submittal" do
      find('.navbar-inner').click_link "My Documents"
      page.text.wont_include "Submit Application"
    end
  end
end