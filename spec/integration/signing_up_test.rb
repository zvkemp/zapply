require_relative "../minitest_helper"

describe "signing up :: integration" do
  before do
    use_javascript
    visit root_path
  end

  it "allows sign up via a form" do
    click_link 'sign up'
    page.text.must_include "Sign up"
  end

  it "creates a new user" do
    visit new_user_registration_path
    fill_in 'Email', with: 'zvkemp@gmail.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_on "Sign up"
    page.text.must_include "Welcome! You have signed up successfully."
    page.text.must_include "sign out"
  end

  it "displays a logout link for signed-in users" do
    login
    page.text.must_include "sign out"
  end

  it "signs in existing users" do
    @user = FactoryGirl.create(:user)
    click_link 'sign in'
    fill_in "Email", with: @user.email
    fill_in "Password", with: 'password'
    click_on 'Sign in'
    page.text.must_include "Signed in successfully"
  end

  describe "user is logged in" do
    before do
      login
      visit root_path
    end

    it "displays the logged in user's email address" do
      page.text.must_include @user.email
    end

    it "displays a my documents link in the hero unit" do
      find('#about_main').text.must_include('My Documents')
    end

    it "displays a my documents link in the navigation bar" do
      find('.navbar-inner').text.must_include 'My Documents'
    end

    it "doesn't display the sign-in link" do
      page.text.wont_include "sign in"
    end

    it "doesn't display the sign-up link" do
      page.text.wont_include 'sign up'
    end

    it 'displays the sign out link' do
      page.text.must_include 'sign out'
    end

    it 'redirects from the sign in page' do
      visit new_user_session_path
      page.text.must_include "You are already signed in"
      page.text.wont_include "Sign in"
      page.text.wont_include "sign in"
    end

    it "redirects from the sign up page" do
      visit new_user_registration_path
      page.text.must_include "You are already signed in"
      page.text.wont_include "Sign in"
      page.text.wont_include "sign in"
    end
  end
end