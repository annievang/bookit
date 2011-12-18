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
  attr_accessible :url, :name, :user_id
  has_and_belongs_to_many :users

  
  #has_many :bookmarkusers
  #has_many :users, :through => :bookmarkusers
  
  validates :url, :length => { :minimum => 10 }, :presence => true
  validates :name, :length => { :maximum => 100 }, :presence => true
  
  validates :user_id, :presence => true
  
  default_scope :order => 'bookmarks.created_at DESC'
  

  
end
