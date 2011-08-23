class LoginsController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
    puts params[:user][:email_id]
    user = User.authenicate(params[:user][:email_id], params[:user][:password])
    puts user
    if user
      session[:User] = user
      puts session[:User]
      redirect_to :action => "index", :controller => "books", :notice => "Logged In!"
    else
      redirect_to logins_path, :notice => "Invalid user"
    end
  end
  
  def destroy
    session[:User] = nil
    session[:Admin] = nil
    redirect_to root_url, :notice => "Logged out!"
  end
  
end
