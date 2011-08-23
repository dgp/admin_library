require 'spec_helper'

describe LoginsController do
  
  it "should store a user in session" do
    User.create(:email_id => "w", :password => "r", :password_confirmation => "r")
    post :create , :user => {:email_id => "w", :password => "r"}
    session[:User][:email_id] == "w"
    response.should redirect_to(books_path)  
  end
  
  it "should not store a user in session" do
    User.create(:email_id => "w", :password => "r", :password_confirmation => "r")
    post :create , :user => {:email_id => "wi", :password => "r"}
    response.should redirect_to(logins_path)  
  end
  
end

