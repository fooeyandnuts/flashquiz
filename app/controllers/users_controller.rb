class UsersController < ApplicationController
  
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success]="Signed In"
      session[:remember_token] = @user.id.to_s
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @quizzes = Quiz.all
    @user = User.find(params[:id])
  end

  protected

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
