class Public::FoodCommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @food = Food.find(params[:food_id])
    food_comment = current_user.comments.new(comment_params)
    food_comment.food_id = @food.id
    food_comment.save
  end

  def destroy
    food_comment = Comment.find(params[:id])
    @food = food_comment.food
    food_comment.destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
