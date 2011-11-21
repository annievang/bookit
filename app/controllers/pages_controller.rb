class PagesController < ApplicationController
  def home
    @title = "Home"
    @bookmark = Bookmark.new if signed_in?
  end

  def contact
  end
  
  def help
  end
  
  def search
  end

end
