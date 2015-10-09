class UsersController < ApplicationController

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash.now[:notice] = "#{@user.name.capitalize} has been created!"
    else
      flash.now[:warning] = "No user has been created!"
    end
    render 'new'
  end

  def new
    @user = User.new
  end

  private
    def user_params
      params.require(:user).permit(:name, :email)
    end
end
