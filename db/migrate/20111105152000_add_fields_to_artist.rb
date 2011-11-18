class AddFieldsToArtist < ActiveRecord::Migration
  def self.up
    add_column :artists, :started_at, :integer
    add_column :artists, :country, :string
  end

  def self.down
    remove_column :artists, :started_at
    remove_column :artists, :country
  end
end
