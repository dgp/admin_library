require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe User, "Email_ID" do
  it "should require email id" do
    user = User.create
    user.should_not be_valid
    user.errors.on(:email_id).should == "can't be blank" 
  end

  it "should be uniqueness" do
    User.create(:email_id => "dg",:password=>"password")
    new_user = User.create(:email_id => "dg",:password=>"password")
    puts new_user.errors
    new_user.errors.on(:email_id).should == "has already been taken" 
  end
  
  it "should require password" do
    user = User.create(:email_id => "e",:password => " ")
    user.errors.on(:password).should == "can't be blank" 
  end
    
  it "authenicate emailId and password" do
    User.create(:email_id => "q", :password => "q")
    new_user = User.authenicate(emailId = "q", password ="q")
    new_user.should_not be_nil
  end
  
  it "authenicate emailId and password" do
      User.create(:email_id => "q", :password => "q")
      new_user = User.authenicate(emailId = "q", password ="w")
      new_user.should be_nil
  end
  
  it "should match password and confirmation password" do
      puts User.match_password("a", "a").should be_true
  end
  
  it "should not match password and confirmation password if not same" do
     puts User.match_password("a", "b").should be_false
  end
  
  
end