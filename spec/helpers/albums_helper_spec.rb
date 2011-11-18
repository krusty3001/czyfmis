require 'spec_helper'

describe AlbumsHelper do
  describe "setup_album" do
    it "fills up track list to fixed size" do
      album = Album.new
      album.tracks.build(:title => "title 2", :number_on_album => 2)
      setup_album(album)
      album.should have(AlbumsHelper::MAX_TRACKS_SIZE).tracks
      album.tracks.detect { |t| t.title == "title 2" }.number_on_album.should eq(2)
    end
  end
end
