class ObservationsController < ApplicationController
  before_action :validate_login, :validate_user

  def index
    @observation = Observation.all
    render json: @observation.to_json
  end
end
