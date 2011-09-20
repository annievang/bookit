class Bookmark < ActiveRecord::Base
  validates :url, :length => { :minimum => 10 }, :presence => true, :uniqueness => true
  validates :name, :length => { :maximum => 100 }, :presence => true
end
