class SessionsController < ApplicationController
  def new
    if logged_in?
      redirect_to categories_path
    end
  end
  def create
    user = User.find_by(email: params[:session][:email].downcase, password: params[:session][:password])
    if user
      log_in user
      redirect_to categories_path
      # Log the user in and redirect to the user's show page.
    else
      flash[:error] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
  end
  def destroy
    log_out
    redirect_to login_path
  end
end
