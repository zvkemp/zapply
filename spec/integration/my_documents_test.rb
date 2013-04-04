require_relative "../minitest_helper"

describe "My Documents :: integration" do
  before do
    use_javascript
  end

  describe "applicants" do
    before do
      login
      find('.navbar-inner').click_link('My Documents')
    end

    it "shows an empty list of documents from the user" do
      find('#my_documents').text.must_include "You have not uploaded any documents."
    end

    it "has instructions" do
      page.text.must_include "Upload your application documents one at a time."
    end

    describe "uploading a file" do
      it "adds the document to the collection" do
        fill_in "document_description", with: "resume"
        click_on "Save"
        page.text.must_include "resume"
        page.text.wont_include "You have not uploaded any documents"
      end

      it "saves the file to the database" do
        fill_in "document_description", with: "resume"
        click_on "Save"
        @user.documents.count.must_equal 1
      end

      it "loads the documents when the page opens" do
        @user.documents.create!(:description => "resume")
        visit root_path
        click_link "My Documents"
        page.text.must_include "resume"
      end
    end
  end

  describe "guests" do
    # TODO: this should include some manual testing.
    it "redirects!" do
      visit root_path
      visit '/#my_documents'
      page.text.wont_include "You have not uploaded any documents."
      page.text.wont_include "Upload your application documents one at a time"
    end
  end

end