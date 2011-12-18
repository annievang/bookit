class Bookmarkuser < ActiveRecord::Base
  attr_accessible :user_id, :bookmark_id
  
  belongs_to :user
  belongs_to :bookmark
end