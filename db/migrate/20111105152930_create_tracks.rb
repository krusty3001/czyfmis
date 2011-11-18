class CreateTracks < ActiveRecord::Migration
  def self.up
    create_table :tracks do |t|
      t.string :title
      t.integer :number_on_album
      t.integer :playtime
      t.references :album

      t.timestamps
    end
  end

  def self.down
    drop_table :tracks
  end
end
