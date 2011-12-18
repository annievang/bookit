class DropBookmarkusers < ActiveRecord::Migration
  def self.up
    drop_table 'bookmarks_users'
    drop_table 'bookmarkusers'
  end

  def self.down
  end
end
