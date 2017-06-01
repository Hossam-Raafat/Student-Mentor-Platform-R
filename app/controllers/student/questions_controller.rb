class Student::QuestionsController < ApplicationController

  before_action :authenticate_student

  def index

   if params[:filter] == "resolved"
    @questions = Question.resolved.includes(:response).includes(:mentor)
  else
    @questions = current_student_student.questions.includes(:response).includes(:mentor)
  end

    respond_to do |format|
      format.json { render json: @questions, include: [:response, :mentor, :student], methods: [:get_upvotes, :get_downvotes] }
    end
  end

  def show
    @question = Question.find(params[:id])
    respond_to do |format|
      format.json { render json: @question, include: [:response, :mentor, :student], methods: [:get_upvotes, :get_downvotes] }
    end
  end

  def create
    @question = current_student_student.questions.new(question_params)
    respond_to do |format|
      if @question.save
        format.json { render json: @question }
      else
        format.json { render json: @question.errors.full_messages, status: :bad_request }
      end
    end
  end

  def update
    @question = Question.find(params[:id])

    if @question.response.nil?

      respond_to do |format|
        if @question.update(question_params)
          format.json { render json: @question }
        else
          format.json { render json: @question.errors.full_messages, status: :bad_request }
        end
      end
    else
      respond_to do |format|
        format.json { render json: @question.errors.full_messages, status: :bad_request  }
      end
    end
  end

  def destroy
    @question = Question.find(params[:id])

    if @question.response.nil?
      @question.destroy
      respond_to do |format|
        format.json { render json: @question }
      end
    else
      respond_to do |format|
        format.json { render json: @question.errors.full_messages, status: :bad_request  }
      end
    end
  end

  private
  def question_params
    params.require(:question).permit(:title, :body, :language, :screenshot)
  end

  def authenticate_student
    return true if current_student_student
    render json: {
      errors: ['Authorized users only.']
    }, status: :unauthorized
  end
end
