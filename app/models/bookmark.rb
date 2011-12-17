# == Schema Information
#
# Table name: bookmarks
#
#  id         :integer         not null, primary key
#  url        :string(255)
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Bookmark < ActiveRecord::Base
  attr_accessible :url, :name
  belongs_to :user
  
  validates :url, :length => { :minimum => 10 }, :presence => true
  validates :name, :length => { :maximum => 100 }, :presence => true
  
  validates :user_id, :presence => true
  
  default_scope :order => 'bookmarks.created_at DESC'
  
end
