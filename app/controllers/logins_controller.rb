class LoginsController < ApplicationController
  
  def new
    
  end
  
  def create
    chef = Chef.find_by(email: params[:email])
    #verify if chef is valid or not
    if chef && chef.authenticate(params[:password])
      
      #save chef id into browser cookie
      session[:chef_id] = chef.id
      flash[:success] = "You are logged in"
      redirect_to recipes_path
      
    else
      flash.now[:danger] = "Your email and password do not matched"
      render 'new'
    end
  end
  
  def destroy
    session[:chef_id] = nil
    flash[:success] = "You have logged out"
    #back to homepage
    redirect_to root_path
  end
end
  