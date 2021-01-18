class ApplicationController < ActionController::API
  def authenticate
    unless http_authorization_header = request.headers["HTTP_AUTHORIZATION"]
      return unauthorized('No http header found')
    end

    unless @current_teacher = Teacher.find_by(token: http_authorization_header)
      return unauthorized('No user with matching token was found')
    end

    @current_teacher
  end

  def unauthorized(message)
    render json: { message: message }, status: 403
  end
end
