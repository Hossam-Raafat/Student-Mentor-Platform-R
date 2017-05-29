class Student::InvitationsController < Devise::InvitationsController

  before_action :authenticate_manager

  include InvitableMethods
  def create
    Student.invite!(invite_params, current_manager_manager) # 'current_manager_manager' beacuse the namespace
    render json: { success: ['User created.'] }, status: :created
  end

  def update
    user = Student.accept_invitation!(accept_invitation_params)
      if user.errors.empty?
        render json: { success: ['User updated.'] }, status: :accepted
      else
        render json: { errors: user.errors.full_messages },
               status: :unprocessable_entity
      end
  end

  private

    def invite_params
      params.require(:student).permit(:email, :invitation_token, :provider, :skip_invitation, :program)
    end

    def accept_invitation_params
      params.require(:student).permit(:password, :password_confirmation, :invitation_token, :name)
    end

    def authenticate_manager
      return true if current_manager_manager
      render json: {
        errors: ['Authorized users only.']
      }, status: :unauthorized
    end
end
