require 'rails_helper'

RSpec.describe SessionController, type: :controller do

  context 'POST sign_in' do
    before { request.content_type = 'application/json' }

    let(:new_user) { create(:user) }
    let(:json) { response_json_body }
    let(:valid_params) { {login: new_user.login, password: new_user.password} }
    
    it 'Login with valid data should result get token' do
      
      params = {data: {type: 'session', attributes: valid_params}}
      post :sign_in, params.to_json
      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(json["token"]).to be
    end

    let(:invalid_password) { {login: new_user.login, password: ''} }
    
    it 'Login with invalid password should result status 403' do
      params = {data: {type: 'session', attributes: invalid_password}}
      post :sign_in, params.to_json
      expect(response).to have_http_status(403)
    end

    let(:invalid_params) { {login: ' ', password: ''} }
    
    it 'Login with invalid data should result status 406' do
      params = {data: {type: 'session', attributes: invalid_params}}
      post :sign_in, params.to_json
      expect(response).to have_http_status(406)
    end

  end

  context "DELETE sign_out" do
    let(:valid_token) {create(:user).token}
    before {request.headers["X-Api-Key"] = valid_token}

    it 'Current user log out should result status 440' do
      delete :sign_out
      expect(response).to have_http_status(440)
    end

  end

end
