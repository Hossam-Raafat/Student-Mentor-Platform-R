Rails.application.routes.draw do

  namespace 'mentor' do
    resources :questions
    resources :responses
    mount_devise_token_auth_for 'Mentor', at: 'auth' , skip: [:invitations]
    devise_for :mentors, path:"auth", only: [:invitations], :controllers => { :invitations => 'mentor/invitations' }
  end

  namespace 'student' do
    resources :questions do
      resources :votes, only: [:create]
    end
    mount_devise_token_auth_for 'Student', at: 'auth' , skip: [:invitations]
    devise_for :students, path:"auth", only: [:invitations], :controllers => { :invitations => 'student/invitations' }
  end

  namespace 'manager' do
    resources :questions
    resources :mentors
    resources :responses
    mount_devise_token_auth_for 'Manager', at: 'auth'
    post 'invite_student', to: 'managers#invite_student'
    post 'invite_mentor', to: 'managers#invite_mentor' # check 3.7 and 3.8 here 'http://guides.rubyonrails.org/routing.html'
    # the above line added this to the routes :
    # " manager_invite_mentor POST     /manager/invite_mentor(.:format)           manager/managers#invite_mentor"
  end

  root to: redirect("http://localhost:3001")

# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

# we added 'namespace' to make sure the routes look like:
# 'mentor/auth','student/auth','manager/auth'
