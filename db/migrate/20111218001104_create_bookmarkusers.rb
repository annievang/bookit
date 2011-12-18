class CreateBookmarkusers < ActiveRecord::Migration
 def self.up
    create_table :bookmarkusers do |t|
      t.integer :user_id
      t.integer :bookmark_id

      t.timestamps
    end
  end

  def self.down
    drop_table :bookmarkusers
  end
end


