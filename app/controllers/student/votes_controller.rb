class Student::VotesController < ApplicationController
  def create
    quest = Question.find(params[:question_id])

    if params[:filter] == "upvote"
       if quest.get_dislikes.where(:voter => current_student_student).length == 0
        @vote = current_student_student.upvotes quest
      else
        quest.unvote_by current_student_student
      end
    else
      puts "in downvote"
      if quest.get_likes.where(:voter => current_student_student).length == 0
        @vote = current_student_student.downvotes quest
      else
        quest.unvote_by current_student_student
      end
    end

    respond_to do |format|
      format.json { render json:  quest, methods: [:get_upvotes, :get_downvotes]}
    end
  end

  # def update
  #   Vote.find(params[:id])
  # end
  # private
  # def vote_params
  #   # byebug
  #   params.permit(:votable_id)
  #   # params.require(:vote).permit(:vote_flag, :vote_weight, :vote_scope, :question_id)
  # end
end
