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
      find('#navigation').text.must_include "Application In Progress"
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
      find('#navigation').text.must_include "Application Submitted"
    end

    it "disables document upload" do
      find('#navigation').click_link "My Application"
      page.text.must_include "Your application has been submitted."
      page.text.must_include "resume"
      page.text.must_include "cover letter"
      page.text.wont_include "Drag your application documents to this window to upload them"
    end

    it "disables application submittal" do
      find('#navigation').click_link "My Application"
      page.text.wont_include "Submit Application..."
    end
  end

  describe "with no documents" do
    it "hides the submit button" do
      find('#navigation').click_link "My Application"
      page.text.wont_include "Submit Application..."
    end
  end

  describe "submitting an application" do
    before do
      @user.documents.create(description: "resume")
      @user.documents.create(description: "cover letter")
      visit root_path
      find('#navigation').click_link('My Application')
    end

    it "includes a note" do
      fill_in "submit_note", with: "this is an application note"
      click_on "save_changes"
      sleep(0.1) # needs to wait for commit
      u = User.find(@user.id)
      u.note.must_equal "this is an application note"
    end

    it "submits via the big green button" do
      click_link "Submit Application..."
      click_link "Confirm"
      sleep(0.1) # needs to wait for commit
      u = User.find(@user.id)
      u.submitted?.must_equal true
      page.text.wont_include "Submit Application..."
    end
  end

  # TODO: two-stage submit interface procedure (ie, submit -> confirm submit)
  # TODO: more instructions


end