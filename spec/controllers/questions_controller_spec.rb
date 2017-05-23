require 'rails_helper'

RSpec.describe QestionsController, type: :controller do
  context 'listing' do
    it "should return answered questions in the database" do

    end
    it "should returned all questions in the database" do
      question1, question2 = create(:question), create(:question)
      get :index, format: :json

      expect(response.body).to eql( [question1, question2].to_json )
    end
  end
end
