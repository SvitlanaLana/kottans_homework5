class SessionController < ApplicationController
before_action :validate_login, :validate_user , only: [:sign_out]

  def sign_in
    data = ActiveModelSerializers::Deserialization.jsonapi_parse(params)
    user = User.where(login: data[:login]).first
    head 406 and return unless user
    if user.authenticate(data[:password])
      user.regenerate_token
      render json: user.to_json(only: [:token]) and return
    end
    head 403
  end

  def sign_out
    @current_user.token = nil
    head 440
  end
end
