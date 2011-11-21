class SessionsController < ApplicationController

  def new

    if signed_in?
      @title = "Sign in"

      redirect_to :controller => 'users', :action => 'show', :id => current_user.id
    #redirect_to @user
    else
      # Sign the user in and redirect to the user's show page.
      @title = "Sign in"
      render 'new'
    end
  end
  
  def create
    user = User.authenticate(params[:session][:email],
                             params[:session][:password])
    if user.nil?
      flash.now[:error] = "Invalid email/password combination."
      @title = "Sign in"
      render 'new'
    else
      # Sign the user in and redirect to the user's show page.
      sign_in user
      redirect_to user
    end
  end
  
  def destroy
    sign_out
    redirect_to root_path
  end
  
end
