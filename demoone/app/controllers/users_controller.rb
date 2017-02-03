class UsersController < ApplicationController

  #before_action :validate_user #, only: [:index]
  before_action :validate_type, only: [:create]

  def index
    @users = User.all
    render json: @users.to_json(only: [:full_name, :login, :token])
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user, status: :created
    else
      render_error(user, :unprocessable_entity)

    end
  end

  private

  def user_params
    ActiveModelSerializers::Deserialization.jsonapi_parse(params)
  end
end
