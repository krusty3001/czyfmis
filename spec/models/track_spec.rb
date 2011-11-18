require 'spec_helper'

describe Track do

  it "should validate playtime format" do
    Track.new(:playtime => "01:10").should be_valid
    Track.new(:playtime => "1:10").should be_valid
    Track.new(:playtime => "59:59").should be_valid
    Track.new(:playtime => "00:00").should be_valid
    
    Track.new(:playtime => "10").should be_invalid
    Track.new(:playtime => "sdfdsf").should be_invalid
    Track.new(:playtime => ":10").should be_invalid
    Track.new(:playtime => "01:").should be_invalid
    Track.new(:playtime => "0:1").should be_invalid
    Track.new(:playtime => "01:1").should be_invalid
    Track.new(:playtime => "01:81").should be_invalid
    Track.new(:playtime => "0:61").should be_invalid
  end

  it "should find tracks by title or artist" do
    Track.simple_search("love").should eq([tracks(:one)])
    Track.simple_search("feist").should eq([tracks(:one)])
    Track.simple_search("ghghgfhg").should eq([])
  end
  
end
