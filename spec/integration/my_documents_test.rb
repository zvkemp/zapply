require_relative "../minitest_helper"

describe "My Application :: integration" do
  before do
    use_javascript
  end

  describe "applicants" do
    before do
      login
      find('#navigation').click_link('My Application')
    end

    it "shows an empty list of documents from the user" do
      page.text.must_include "You have not uploaded any documents"
    end

    it "has instructions" do
      page.text.must_include "Drag your application documents to this window to upload them, or use the file picker below"
    end

    describe "uploading a file" do
      it "adds the document to the collection" do
        skip "needs update for new file upload"
        # click_link "new document"
        # fill_in "document_description", with: "resume"
        find(:css, "input.document_description").set("resume")
        click_on "Upload"
        page.text.must_include "resume"
        page.text.wont_include "You have not uploaded any documents"
      end

      it "Uploads the file to the database" do
        skip "needs update for new file upload"
        # click_link "new document"
        # fill_in "document_description", with: "resume"
        find(:css, "input.document_description").set("resume")
        click_on "Upload"
        @user.documents.count.must_equal 1
      end

      describe "existing files" do
        before do
          @user.documents.create!(description: "My Resume")
          visit root_path
          find('#navigation').click_link "My Application"
        end

        it "loads the documents when the page opens" do
          page.text.must_include "My Resume"
        end

        it "deletes a file" do
          skip 'not working for unknown reason'
          click_on 'delete'
          page.text.wont_include "My Resume"
        end

        it "deletes from the database" do
          skip 'not working for unknown reason'
          click_on 'delete'
          @user.documents.count.must_equal 0
        end

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