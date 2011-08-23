require 'spec_helper'

describe Book do
  it "title should not be blank " do
    book = Book.create(:title => " ", :author => "w", :isbn => "e", :quantity => "r")
    book.errors.on(:title).should == "can't be blank"  
  end
  it "author should not be blank " do
    book = Book.create(:title => " w", :author => "", :isbn => "e", :quantity => "r")
    book.errors.on(:author).should == "can't be blank"  
  end
  it "isbn should not be blank " do
    book = Book.create(:title => "w ", :author => "w", :isbn => "", :quantity => "r")
    book.errors.on(:isbn).should == "can't be blank"  
  end
  it "quantity should not be blank " do
    book = Book.create(:title => "w ", :author => "w", :isbn => "e", :quantity => "")
    book.errors.on(:quantity).should == "can't be blank"  
  end
  
  # it "should isbn be unique" do
  #     book = Book.create(:title => "w ", :author => "w", :isbn => "e", :quantity => "4")
  #     book = Book.create(:title => "w ", :author => "e", :isbn => "e", :quantity => "4")
  #     book.errors.on(:isbn).should == "has already been taken"
  #   end
  
  it "should search the books" do
     book = Book.create(:title => "Ruby", :author => "Rails", :isbn => "12QWE", :quantity => "3" )
     book = Book.search("ruby")
     
   end
end
