object @session => :session
attributes :email
if @session.is_a? User
  node(:signed_in) { true }
  node(:links) do 
    [{ text: 'My Documents',  href: '#my_documents' },
     { text: 'sign out', href: destroy_user_session_path,
        :'data-method' => 'delete', 
        :rel         => 'nofollow'}
    ]
  end
else
  node(:signed_in) { false }
  node(:session_links) do 
    { 
      'sign up' => { href: new_user_registration_path }, 
      'sign in' => { href: new_user_session_path      }
    }
  end
end
# node(:interface) {|user| user.interface  }
