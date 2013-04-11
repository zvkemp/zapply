module ZapplyLite
  module TestHelpers
    module UsersTestHelper
      def form_login(user = default_user)
        visit new_user_session_path
        fill_in "Email", with: user.email
        fill_in "Password", with: "password"
        click_on "Sign in"
      end

      def default_user
        @user ||= FactoryGirl.create(:user, email: "zvkemp@gmail.com")
      end

      def admin_user
        @user ||= FactoryGirl.create(:user, admin: true, email: "admin@zapply.com")
      end

      def login(user = default_user)
        warden_login(user)
        # form_login(user)
      end

      def warden_login(user = default_user)
        login_as(user, scope: :user, :run_callbacks => false)
        visit root_path
      end

      def as_admin
        as_user admin_user
      end

    end
  end
end