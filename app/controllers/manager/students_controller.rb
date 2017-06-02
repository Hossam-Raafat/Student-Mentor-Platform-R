class Manager::StudentsController < ApplicationController
  before_action :authenticate_manager
  def index
      @students = Student.all
    respond_to do |format|
      format.json { render :json => @students }
    end
  end

  def authenticate_manager
      return true if current_manager_manager
      render json: {
        errors: ['Authorized users only.']
      }, status: :unauthorized
    end
end
