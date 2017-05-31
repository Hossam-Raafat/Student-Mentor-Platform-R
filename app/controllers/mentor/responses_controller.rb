class Mentor::ResponsesController < ApplicationController
  include InvitableMethods
  before_action :authenticate_mentor!

    def create
      # assign mentor id
      @response = current_mentor_mentor.responses.new(response_params)
      respond_to do |format|
        if @response.save
          format.json { render json: @response }
        else
          format.json { render json: @response.errors.full_messages, :status => :bad_request }
        end
      end
    end

    def update
      # status true and answer
      @response = current_mentor_mentor.Response.new
        respond_to do |format|
        if @response.update(response_params)
          format.json { render :json => @response }
        else
          format.json { render:json => @response.errors.full_messages, :status => :bad_request }
        end
      end
    end

    def destroy
      @response = Response.find(params[:id])
      @response.destroy
      respond_to do |format|
        format.json { render :json => @response }
      end
    end

  private
    def response_params
      params.require(:response).permit(:answer, :status, :question_id, :mentor_id)
    end
end
