class BooksController < ApplicationController
  def new
    @book = Book.new
  end
  
  def create
    @book = Book.new(params[:book])
    puts params[:book]
    if @book.save
      redirect_to :action => "index", :controller => "books"
    else
      render :action => "new"
    end
  end
  
  def index
    @books = Book.find(:all, :order => "updated_at DESC")
  end
  
  def edit
    puts params[:id]
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update_attributes(params[:book])
      redirect_to(books_path, :notice => 'Post was successfully updated.')
    else
      render :action => "edit"
    end
  end
end
