class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @book = @user.post_images
  end
  
  def edit
  end

  def index
    @users = User.all
  end

end
