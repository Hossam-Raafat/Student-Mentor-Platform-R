Rails.application.routes.draw do

  namespace 'mentor' do
    mount_devise_token_auth_for 'Mentor', at: 'auth'
  end

  namespace 'student' do
    mount_devise_token_auth_for 'Student', at: 'auth'
  end

  namespace 'manager' do
    mount_devise_token_auth_for 'Manager', at: 'auth'
    post 'invite_mentor', to: 'managers#invite_mentor' # check 3.7 and 3.8 here 'http://guides.rubyonrails.org/routing.html'
    # the above line added this to the routes : 
    # " manager_invite_mentor POST     /manager/invite_mentor(.:format)           manager/managers#invite_mentor"
  end


# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

# we added 'namespace' to make sure the routes look like:
# 'mentor/auth','student/auth','manager/auth'