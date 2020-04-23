class UserController < ApplicationController

  def show
    @user = User.find(params[:id])
   render json: @user, status: :accepted
  end

  def create
    user = User.new(
      username: params[:username],
      email: params[:email],
      password: params[:password]
    )
    if user.save
      jwt = encode_token(user.id)
      render json: {user: UserSerializer.new(user), jwt: jwt}
    else
      render json: {errors: user.errors.full_messages}
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
