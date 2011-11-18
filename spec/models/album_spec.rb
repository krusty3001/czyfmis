require 'spec_helper'

describe Album do

  it "should validate mandatory fields" do
    artist = mock_model(Artist, :name => "Feist")
    Album.new(:artist => artist).should be_invalid
    Album.new(:title => "Reminder").should be_invalid
    Album.new(:artist => artist, :title => "Reminder").should be_valid
  end

  it "should ignore in-memory comment for saved_comments" do
    album = albums(:reminder)
    album.comments.create(:comment => "hello 1")
    album.comments.build
    album.should have(1).saved_comment
    album.saved_comments[0].comment.should eql("hello 1")
  end

  it "should sort tracks by playtime" do
    album = Album.new
    album.tracks.build(:number_on_album => 3)
    album.tracks.build(:number_on_album => 1)
    album.tracks.build(:number_on_album => 5)
    album.sorted_tracks.size.should == 3
    album.sorted_tracks[0].number_on_album.should == 1
    album.sorted_tracks[1].number_on_album.should == 3
    album.sorted_tracks[2].number_on_album.should == 5
  end

  it "should tell whether it has track with given number" do
    album = Album.new
    album.tracks.build(:number_on_album => 3)
    album.tracks.build(:number_on_album => 1)
    album.should have_track(3)
    album.should have_track(1)
    album.should_not have_track(2)
    album.should_not have_track(4)
  end

  it "should find albumss by title or artist" do
    Album.simple_search("bad").should eq([albums(:bad)])
    Album.simple_search("michael").should eq([albums(:bad)])
    Album.simple_search("ghghgfhg").should eq([])
  end  
  
end
