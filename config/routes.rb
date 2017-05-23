Rails.application.routes.draw do

  mount_devise_token_auth_for 'Mentor', at: 'mentor-auth'
  mount_devise_token_auth_for 'Student', at: 'student-auth'
  mount_devise_token_auth_for 'Manager', at: 'manager-auth'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
