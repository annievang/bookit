class DeleteBookmarksUsers < ActiveRecord::Migration
  def self.up
    drop_table 'bookmarks_users'
  end

  def self.down
  end
end
