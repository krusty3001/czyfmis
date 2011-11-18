class PlaytimeAsString < ActiveRecord::Migration
  def self.up
    change_column :tracks, :playtime, :string, :limit => 5
  end

  def self.down
    change_column :tracks, :playtime, :integer
  end
end
