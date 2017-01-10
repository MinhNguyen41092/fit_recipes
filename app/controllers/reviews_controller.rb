class ReviewsController < ApplicationController
  before_action :require_user, except: [:show, :index, :like]
  before_action :require_recipe, except: [:show, :index, :like]
  
  def new
    @review = Review.new
  end
  
  def create
    @review = Review.new(review_params)
    @review.chef = current_user
    
    if @review.save 
      flash[:success] = "Your Review has been saved successfully"
      redirect_to recipes_path
    else
      render 'new'
    end
  end
  
  private
  
    def review_params
      params.require(:review).permit(:name, :body)
    end
  
end