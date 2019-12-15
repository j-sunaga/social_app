class RelationshipsController < ApplicationController

  def index
    @users = User.all
  end

  def create
    @user = User.find(params[:id])
    current_user.be_friend(@user)
    redirect_to relationships_path
  end

  def destroy
    @user = User.find(params[:id])
    current_user.un_friend(@user)
    redirect_to relationships_path
  end

end
