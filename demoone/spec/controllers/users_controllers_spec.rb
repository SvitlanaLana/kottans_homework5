require 'spec_helper'

RSpec.describe UsersController, type: :controller do 

  context "POST create"  do
    before { request.content_type = 'application/json' }

    let(:new_user_params) { { full_name: "q", login: "q@net", password: "123" } }
    let(:json) { response_json_body }

    it "Creating new user with valid data should result create new user" do
      post :create, params: { data: { type: "users", attributes: new_user_params } }
      expect(response).to be_success
      expect(response).to have_http_status(201)
      expect(json['data']['attributes']['full-name']).to eq('q')
    end

    it 'Creating new user with empty params should result status errors 422' do
      request.content_type = 'application/json'
      params = {"data": { "type": "users" } } 
      post :create, params: params
      expect(response).to have_http_status(422)
      expect(json['errors'].map { |e| e['source']['pointer'].split('/').last }.sort).to eq(["full-name", "login", "password"])
    end

  end
end