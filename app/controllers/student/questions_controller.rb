class Student::QuestionsController < ApplicationController
  include InvitableMethods
  before_action :authenticate_student!

  def index
    @questions = Question.all
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
end
