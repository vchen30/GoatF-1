class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "You signed up successfully"
      flash[:color]= "valid"
      log_in @user
      flash[:sucess] = "Welcome to GoatF!"
      redirect_to @user
    else
      flash[:notice] = "Form is invalid"
      flash[:color]= "invalid"
      render "new"
    end

  end

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
