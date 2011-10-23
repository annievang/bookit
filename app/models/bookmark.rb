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
  belongs_to :user
  
  validates :url, :length => { :minimum => 10 }, :presence => true, :uniqueness => true
  validates :name, :length => { :maximum => 100 }, :presence => true
end
