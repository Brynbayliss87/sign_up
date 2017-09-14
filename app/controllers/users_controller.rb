class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Thanks for signing up"
      render 'new'
    else
      flash[:fail] = "Sign up failed please try again"
      render 'new'
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

 def index
 end

 def update
  render 'new'
 end
end
