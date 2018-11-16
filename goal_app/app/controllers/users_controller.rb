class UsersController < ApplicationController
  
  def new
      render :new
  end
  
  def create
    user = User.new(user_params)
    
    if user.save
      login(user)
      redirect_to user_url(user)
    else
      flash.now[:errors] = user.errors.full_messages status: 418
      render :new
    end
  end
  
  def index
    render :index
  end
  
  def show
    @user = User.find(params[:id])
    if @user
      render :show
    else
      render :index
    end
  end

  def user_params
    params.require(:user).permit(:username, :password)
  end  
  
end
