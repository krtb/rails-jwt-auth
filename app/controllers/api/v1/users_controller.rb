class Api::V1::UsersController < ApplicationController


    def create
    @user = User.create(user_params)
    if @user.valid?
      # https://gist.github.com/mlanett/a31c340b132ddefa9cca = send Rails HTTP status codes
      render json: { user: UserSerializer.new(@user) }, status: :created
    else
      render json: { error: 'failed to create user' }, status: :not_acceptable
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :password, :bio, :avatar)
  end
end
