class AddBookmarksUsers < ActiveRecord::Migration
  def self.up
  create_table 'bookmarks_users', :id => false do |t|
    t.column :bookmark_id, :integer
    t.column :user_id, :integer
  end
  
  add_index(:bookmarks_users, [:bookmark_id, :user_id])
  
  end

  def self.down
    drop_table 'bookmarks_users'
  end
end
