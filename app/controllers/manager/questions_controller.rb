class Manager::QuestionsController < ApplicationController

  before_action :authenticate_manager

  def index
    params[:filter] === "resolved" ? @questions = Question.resolved : @questions = Question.all
    respond_to do |format|
      format.json { render :json => @questions }
    end
  end

  def show
    @question = Question.find(params[:id])
    respond_to do |format|
      format.json { render :json => @question }
    end
  end

  def create
    @question = Question.new(question_params)
    respond_to do |format|
      if @question.save
        format.json { render json: @question }
      else
        format.json { render json: @question.errors.full_messages, :status => :bad_request }
      end
    end
  end

  def update
    @question = Question.find(params[:id])
    if !@question.response.exists?
      respond_to do |format|
        if @question.update(question_params)
          format.json { render :json => @question }
        else
          format.json { render:json => @question.errors.full_messages, :status => :bad_request }
        end
      end
    end
  end

  def destroy
    @question = Question.find(params[:id])
    if !@question.response.exists?
      @question.destroy
      respond_to do |format|
        format.json { render :json => @question }
      end
    end
  end

  private
  def question_params
    params.require(:question).permit(:title, :body, :language, :screenshot)
  end

  def authenticate_manager
    return true if current_manager_manager
    render json: {
      errors: ['Authorized users only.']
    }, status: :unauthorized
  end
end
