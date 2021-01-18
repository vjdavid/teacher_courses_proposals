class AuthenticationController < ApplicationController
  def login
    unless @teacher = Teacher.find_by(email: params[:email])
      return unauthoized('No use with this email was found')
    end

    if @teacher.authenticate(params[:password])
      render json: { token: @teacher.token }
    else
      return unauthoized('Password does not match for this user')
    end
  end
end
