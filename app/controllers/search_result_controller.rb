class SearchResultController < ApplicationController
  def index
  end
  
  def create
    search_word = params[:search][:search]
    puts search_word
    #@search_result = Book.search search
    #puts @search_result
    @search_result =  Book.find(:all, :conditions => ["title LIKE ?", "%#{search_word}%"])
    redirect_to :controller => "search_result", :action => "index", :notice => "Signed up!" 
  end

end
