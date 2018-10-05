class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
  skip_before_action :verify_authenticity_token
  before_action :skip_session

  protected
    def skip_session
      request.session_options[:skip] = true
    end
end
