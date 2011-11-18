class CreateAlbums < ActiveRecord::Migration
  def self.up
    create_table :albums do |t|
      t.string :title
      t.date :released_at
      t.references :artist

      t.timestamps
    end
  end

  def self.down
    drop_table :albums
  end
end
