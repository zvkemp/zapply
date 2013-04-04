object @user
attributes :email
if @user.is_a? User
  node(:logged_in) { true }
  node(:session_links) do 
    { 
      'My Documents' => { 'href' => '#my_documents' },
      'sign out' => {
        'href'        => destroy_user_session_path,
        'data-method' => 'delete', 
        'rel'         => 'nofollow'
      }
    }
  end
else
  node(:logged_in) { false }
  node(:session_links) do 
    { 
      'sign up' => { href: new_user_registration_path }, 
      'sign in' => { href: new_user_session_path      }
    }
  end
end
# node(:interface) {|user| user.interface  }
