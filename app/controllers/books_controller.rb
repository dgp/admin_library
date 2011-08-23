class BooksController < ApplicationController
  def new
    @book = Book.new
  end
  
  def create
    @book = Book.new(params[:book])
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
  
  def search
    search_word = params[:search]
    @books = Book.find(:all, :conditions => ['title LIKE ? OR author LIKE ?', "%#{search_word}%", "%#{search_word}%"] )
  end
end
