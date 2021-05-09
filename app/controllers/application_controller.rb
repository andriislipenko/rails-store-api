class ApplicationController < ActionController::API
  KEY = 'qwewerert'

  before_action :authorized

  def encode_token(payload)
    JWT.encode(payload, KEY)
  end

  def decode_token
    if auth_header
      token = auth_header
      begin
        JWT.decode(token, KEY, true, algorithm: 'HS256')
      rescue JWT::DecodeError
        nil
      end
    end
  end

  def logged_in?
    !!logged_in_user
  end

  def authorized
    render json: { message: 'Please log in!' }, status: :unauthorized unless logged_in?
  end

  private

  def auth_header
    request.headers['Authorization']
  end

  def logged_in_user
    if decode_token
      user_id = decode_token[0]['user_id']
      @user = User.find(user_id)
    end
  end
end
