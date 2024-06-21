class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_user, only: [:update, :edit]

  def show
    @user = User.find(params[:id])
    @foods = @user.foods.all
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :image, :is_active, :email)
  end

  def is_matching_login_user
    user = User.find(current_user.id)
    unless user.id == current_user.id
      redirect_to new_user_session_path
    end
  end

  def authorize_user
    user = User.find(params[:id])
    unless current_user == user
      flash[:notice] = '他のユーザーの情報を編集することはできません。'
      redirect_to foods_path
    end
  end
end
