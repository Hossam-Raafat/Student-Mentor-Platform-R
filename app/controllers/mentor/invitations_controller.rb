class Mentor::InvitationsController < Devise::InvitationsController
  include InvitableMethods
  before_action :authenticate_manager

  include InvitableMethods
  def create
    Mentor.invite!(invite_params, current_manager_manager) # 'current_manager_manager' beacuse the namespace
    render json: { success: ['User created.'] }, status: :created
  end

  def update
    user = Mentor.accept_invitation!(accept_invitation_params)
      if user.errors.empty?
        render json: { success: ['User updated.'] }, status: :accepted
      else
        render json: { errors: user.errors.full_messages },
               status: :unprocessable_entity
      end
  end

  private

    def invite_params
      params.require(:mentor).permit(:email, :invitation_token, :provider, :skip_invitation)
    end

    def accept_invitation_params
      params.require(:mentor).permit(:password, :password_confirmation, :invitation_token)
    end

    def authenticate_manager
      return true if current_manager_manager
      render json: {
        errors: ['Authorized users only.']
      }, status: :unauthorized
    end
end
