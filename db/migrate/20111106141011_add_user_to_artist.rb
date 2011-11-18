class AddUserToArtist < ActiveRecord::Migration
  def self.up
    add_column :artists, :user_id, :integer
  end

  def self.down
    remove_column :artists, :user_id
  end
end
