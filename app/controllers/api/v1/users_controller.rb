class Api::V1::UsersController < ApplicationController
  # authorized action coming from ApplicationController
  skip_before_action :authorized, only: [:create]

  def create
    @user = User.create(user_params)
    if @user.valid?
      #  issues a token when users register for our app
      @token = encode_token(user_id: @user.id)
      # https://gist.github.com/mlanett/a31c340b132ddefa9cca = send Rails HTTP status codes
      render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
    else
      render json: { error: 'failed to create user' }, status: :not_acceptable
    end
  end

  def profile
    # authed user can access profile info
    render json: { user: UserSerializer.new(current_user) }, status: :accepted
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :bio, :avatar)
  end

end
