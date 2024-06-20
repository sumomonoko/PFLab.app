class Admin::FoodsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @foods = Food.all
    @genres = Genre.all
  end

  def show
    @food = Food.find(params[:id])
    @user = @food.user
  end

  def destroy
    @food = Food.find(params[:id])
    @user = @food.user
    if @food.destroy
      flash[:notice] = "投稿が削除されました。"
      redirect_to admin_foods_path
    end
  end
end
