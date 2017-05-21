Rails.application.routes.draw do

  namespace 'mentor' do
    mount_devise_token_auth_for 'Mentor', at: 'auth'
  end

  namespace 'student' do
    mount_devise_token_auth_for 'Student', at: 'auth'
  end

  namespace 'manager' do
    mount_devise_token_auth_for 'Manager', at: 'auth'
  end

  resources :questions
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

# we added 'namespace' to make sure the routes look like:
# 'mentor/auth','student/auth','manager/auth'
