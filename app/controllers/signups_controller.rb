class SignupsController < ApplicationController
  def new
    @signup = User.new
  end
  
  def create
    @signup = User.new(params[:signups])
    puts params[:signups]
    match_occur = User.match_password(params[:signups][:password], params[:signups][:password_confirmation])
    if match_occur && @signup.save
      puts params[:signups][:password_confirmation]
      puts "saved"
      redirect_to root_url, :notice => "Signed up!"
    else
      puts "not saved"
      render :action => "new"
    end
  end

end
