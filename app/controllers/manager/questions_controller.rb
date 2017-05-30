class Manager::QuestionsController < ApplicationController
  before_action :authenticate_manager

  def index
    if params[:filter] === "resolved"
      @questions = Question.resolved
    elsif params[:filter] === "unclaimed"
      @questions = Question.unclaimed
    elsif params[:filter] === "resolvedByMentor"
      @questions = Question.resolvedByMentor(params[:mentor_id])
    else
      @questions = Question.all.includes(:response)
    end
    respond_to do |format|
      format.json { render :json => @questions, include: :response  } # TODO: use jbuilder to only send 'answer' for response
      # render :json => @users.as_json(:only => [:first_name, :state])
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

    if @question.response.nil?

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

    if @question.response.nil?

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
