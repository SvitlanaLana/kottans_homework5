class ApplicationController < ActionController::API
  before_action :check_header

  private

  def check_header
    if ['POST'].include? request.method
      if request.content_type != "application/vnd.api+json" && request.content_type != 'application/json'
        head 406 and return
      end
    end
  end

  def validate_type
    return true if params['data'] && params['data']['type'] == params[:controller]
    head 409 and return
  end

  def validate_login
    token = request.headers["X-Api-Key"]
    return unless token
    user = User.find_by token: token
    return unless user
    if 120.minutes.ago < user.updated_at
      user.touch
      @current_user = user
    end
  end

  def validate_user
    head 403 and return unless @current_user
  end

  def render_error(resource, status)
    render json: resource, status: status, adapter: :json_api, serializer: ActiveModel::Serializer::ErrorSerializer
  end

end
