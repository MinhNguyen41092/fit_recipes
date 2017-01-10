class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # Methods created here are all available to other controllers.
  # But they are not available to the views.
  protect_from_forgery with: :exception
  
  # To make methods available to the views
  helper_method :current_user, :logged_in?
  
  def current_user
    # Store things to @current_user
    @current_user ||= Chef.find(session[:chef_id]) if session[:chef_id]
  end
  
  def logged_in?
    # Turn current_user to boolean
    !!current_user
  end
  
  def require_user
    if !logged_in?
      flash[:danger] = "You must be logged in to perform that action"
      redirect_to recipes_path
    end
  end
  
  def current_recipe
    
    @current_recipe = Recipe.find_by_id(session[:current_recipe_id])
  end
  
  def recipe?
    !!current_recipe
  end
  
  def require_recipe
    if !recipe?
      flash[:danger] = "You have to choose a recipe to perform that action"
      redirect_to recipes_path
    end
  end
end

