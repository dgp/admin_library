class User < ActiveRecord::Base
  
  validates_confirmation_of :password
  validates_confirmation_of :password_confirmation
  validates_uniqueness_of :email_id, :on =>:create
  validates_presence_of :password, :on => :create
  validates_presence_of :email_id, :on => :create
  
  def self.authenicate(email_id, password)
    user = find_by_email_id(email_id)
    if user && user.password == password
      return user
    else
      return nil
    end
  end
  
  def self.match_password(password,confirmation)
    password == confirmation 
  end
  
end
