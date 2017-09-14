class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Thanks for signing up"
    else
      render 'new'
      flash[:fail] = "Sign up failed please try again"
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

 def index
 end
end
