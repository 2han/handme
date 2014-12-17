class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  def new
    @review = Review.new
    @user = User.find(params[:user_id])
  end




  def create
    @review = Review.new(review_params)
    @review.save
    raise "hi"
    # @user = User.find(params[:review][:reviewing_id])
    # current_user.review!(@user)
    redirect_to @review
  end

  # def destroy
  #   @user = Review.find(params[:id]).reviewing
  #   current_user.unfollow!(@user)
  #   redirect_to @user
  # end

private

    def set_review
      @review = Review.find(params[:id])
    end

    def review_params
      params.require(:review).permit(:text, :score, :reviewed_id, :reviewing_id)
    end

end

