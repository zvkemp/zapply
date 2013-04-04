require_relative "../minitest_helper"

describe "My Documents :: integration" do

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

end