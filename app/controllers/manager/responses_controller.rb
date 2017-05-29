class Manager::ResponsesController < ApplicationController

  before_action :authenticate_manager

    def index
      
      if params[:filter] === "resolvedByMentor"
        @responses = Response.resolvedByMentor(params[:mentor_id])
      else
        @responses = Response.all
      end
      respond_to do |format|
        format.json { render :json => @responses }
      end
    end

    private
    def response_params
      params.require(:response).permit(:answer, :status)
    end

    def authenticate_manager
      return true if current_manager_manager
      render json: {
        errors: ['Authorized users only.']
      }, status: :unauthorized
    end
  
end
