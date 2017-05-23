class Manager::ManagersController < ApplicationController

  def invite_mentor
    invitee = Mentor.invite!({:email => email})
    render :json => Rails.application.routes.url_helpers.accept_invitation_url(invitee, :invitation_token => raw_token)
  end

  def invite_student
    invitee = Student.invite!({:email => email})
    render :json => Rails.application.routes.url_helpers.accept_invitation_url(invitee, :invitation_token => raw_token)
  end

end
