module UsersHelper
    def getbookmarkcount
    @urlcount = Bookmark.count(:group => :url,
    :conditions => "url IS NOT NULL AND url != ''")
    
  end
end
