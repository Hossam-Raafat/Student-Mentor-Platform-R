require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do
  before do
    @student = FactoryGirl.create(:student)
    sign_in(@student)
    request.headers.merge! @student.create_new_auth_token
  end
  context 'listing' do
    it "should return answered questions in the database" do

    end
    it "should returned all questions in the database" do
      question1, question2 = FactoryGirl.create(:unresolved_question, student_id: @student.id ), FactoryGirl.create(:resolved_question, student_id: @student.id)
      get :index, format: :json

      expect(response.body).to eql( [question2].to_json )
    end
  end
end
