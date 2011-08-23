require 'spec_helper'

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SignupsController, "creating a new user" do
  def do_create
     post :create, :signups => {:email_id => "w", :password => "r", :password_confirmation => "r"}
  end
  it "should create a new user for valid email password" do
    do_create
    response.should redirect_to(root_url) 
  end
  
  def do_new_user
    post :create, :signups => {:email_id => "w", :password => "r", :password_confirmation => "r"}
  end
  
  it "should not create a user when email exists" do
    user = post :create, :signups => {:email_id => "w", :password => "r", :password_confirmation => "r"}
    new_user = post :create, :signups => {:email_id => "w", :password => "r", :password_confirmation => "r"}
    response.should render_template(controller => 'signups', :action => 'new')
  end
  
  
  it "should create a user if password and confirm_password same" do
    post :create, :signups => {:email_id => "w", :password => "s", :password_confirmation => "s"}
    response.should redirect_to(root_url)   
  end
  
  it "should not create a user if password and confirm_password not same" do
    post :create, :signups => {:email_id => "w", :password => "s", :password_confirmation => "W"}
    response.should render_template(controller => 'signups', :action => 'new')
  end
  
  
  
end

