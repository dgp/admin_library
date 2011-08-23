require 'spec_helper'
require '/Users/dinesh/admin_library/app/controllers/books_controller.rb'

describe SearchResultController do

  it "should search the title from the book" do
    book = Book.create :title => "Ruby", :author => "Rails", :isbn => "12QWE", :quantity => "3" 
    get :create, :search => {:search => "uj"}
    assigns(book).should eq(@search_result)
  end

end
