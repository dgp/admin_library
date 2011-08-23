require 'spec_helper'

describe BooksController do

  it "should create a object and allocate memory" do
    get :new
    assigns(:book).should_not be_nil
  end

  it "should create a new book" do  
    #:book =>  
    post :create, :book => {:title => "Ruby", :author => "Rails", :isbn => "12QWE", :quantity => "4" } 
 
    response.should redirect_to(:action => "index", :controller => "books") 
  end
  
  it "should not create a new book" do
    post :create, :book => {:title => "Ruby", :author => "Rails", :isbn => "12QWE", :quantity => "4" } 
    response.should render_template(:controller => 'books', :action => 'new') 
  end 
  
  it "should display the books" do
    Book.create({:title => "Ruby", :author => "Rails", :isbn => "12QWE", :quantity => "4" })
    get :index
    assigns(:bookss).should_not be_nil 
  end

  it "should update the book" do
    book = Book.create :title => "Ruby", :author => "Rails", :isbn => "12QWE", :quantity => "3" 

    put :update, :id => book.id, :book => {:title => "Ru", :author => "Rai", :isbn => "12QWE", :quantity => "3" }
    assigns(:book).should eq(book)
    response.should redirect_to(books_path)
  end 
  
  it "should edit the books" do    
    book = Book.create! :title => "Ruby", :author => "Rails", :isbn => "12QWE", :quantity => "4"
    get :edit, :id => book.id.to_s
    assigns(:book).should eq(book)
  end
  
  
  it "should search the title from the book" do
    book = Book.create :title => "Ruby", :author => "Rails", :isbn => "12QWE", :quantity => "3" 
    get :search, :search => "Ruby"
    assigns(:book).should eq(@books)
    response.should redirect_to(search_result_path)
  end
  
end
