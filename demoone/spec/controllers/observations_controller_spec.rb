require 'spec_helper'

RSpec.describe ObservationsController, type: :controller do 

  context "GET index"  do
    before {request.headers["X-Api-Key"] = create(:user).token}
    before { request.content_type = 'application/json' }


    it "Shoud result informaion about weather" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end
end