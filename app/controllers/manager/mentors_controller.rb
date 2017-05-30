class Manager::MentorsController < ApplicationController
  before_action :authenticate_manager

  def index
      @mentors = Mentor.all
    respond_to do |format|
      format.json { render :json => @mentors }
    end
  end

  def show
    @mentor = Mentor.find(params[:id])
    respond_to do |format|
      format.json { render :json => @mentor }
    end
  end

  def create
    @mentor = Mentor.new(mentor_params)
    respond_to do |format|
      if @mentor.save
        format.json { render json: @mentor }
      else
        format.json { render json: @mentor.errors.full_messages, :status => :bad_request }
      end
    end
  end

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

  def destroy
    @mentor = Mentor.find(params[:id])
    @mentor.destroy
    respond_to do |format|
      format.json { render :json => @mentor }
    end
  end

  private
  def mentor_params
    params.require(:mentor).permit(:status)
  end


  def authenticate_manager
    return true if current_manager_manager
    render json: {
      errors: ['Authorized users only.']
    }, status: :unauthorized
  end

  def authenticate_mentor
    return true if current_manager_manager
    render json: {
      errors: ['Authorized users only.']
    }, status: :unauthorized
  end
end
