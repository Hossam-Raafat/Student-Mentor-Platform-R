class Mentor::MentorsController < ApplicationController
  include InvitableMethods
  before_action :authenticate_mentor!

  def update
    @mentor = Mentor.find(params[:id])
      respond_to do |format|
        if @mentor.update mentor_params
        format.json { render json: @mentor }
      else
        format.json { render json: @mentor.errors.full_messages, :status => :bad_request }
      end
    end
  end

  private
  def mentor_params
    params.require(:mentor).permit(:status)
  end
end
