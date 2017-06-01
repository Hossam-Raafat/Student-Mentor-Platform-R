class Mentor::QuestionsController < ApplicationController
  include InvitableMethods
  before_action :authenticate_mentor!

  def index
    # if params[:filter] === "resolved"
    #   @questions = Question.resolved.as_json(include: :response)
    # elsif params[:filter] === "unclaimed"
    #   @questions = Question.unclaimed.as_json(include: :response)
    # else
      # @questions = Question.all.includes(:response).group_by(&:status).map{|k,v| {k => v.map{|q| q.as_json(include: :response)}}}.inject(&:merge)
      # @questions = Question.all.includes(:response)
    # end

    all_questions = Question.all.includes(:response)
    unclaimed_questions = Question.unclaimed
    mentor_claimed_questions = current_mentor_mentor.claimed_questions.includes(:response)

    @questions = {
      resolved: all_questions.as_json(include: [:response, :student]),
      unclaimed: unclaimed_questions.as_json(include: [:student]),
      claimed: mentor_claimed_questions.as_json(include: [:response, :student])
    }

    respond_to do |format|
      format.json { render :json => @questions } # TODO: use jbuilder to only send 'answer' for response
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
    # @question = Question.new(question_params)
    # respond_to do |format|
    #   if @question.save
    #     format.json { render json: @question }
    #   else
    #     format.json { render json: @question.errors.full_messages, :status => :bad_request }
    #   end
    # end
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
    params.require(:question).permit(:title, :body, :language, :screenshot, :status)
  end
end
