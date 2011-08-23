class Book < ActiveRecord::Base
  validates_presence_of :title, :author, :isbn, :quantity
  
  # def self.search(search)
  #     search_condition = "%" + search + "%"
  #     puts search_condition
  #     @search_result = find(:all, :conditions => ['title LIKE ?', search_condition])
  #     puts @search_result.title
  #     return @search_result
  #   end
  
end
