require 'spec_helper'
require 'time_helper'

describe TimeHelper do
  include TimeHelper
  
  it "should convert seconds to human readable format" do
    TimeHelper.seconds_to_human(70).should == "01:10"
    TimeHelper.seconds_to_human(0).should == "00:00"
    TimeHelper.seconds_to_human(60).should == "01:00"
    TimeHelper.seconds_to_human(15).should == "00:15"
    TimeHelper.seconds_to_human(3).should == "00:03"
    TimeHelper.seconds_to_human(260).should == "04:20"
    TimeHelper.seconds_to_human(611).should == "10:11"
  end

  it "should convert human format to seconds" do
    TimeHelper.human_to_seconds("01:10").should == 70
    TimeHelper.human_to_seconds("00:00").should == 0
    TimeHelper.human_to_seconds("01:00").should == 60
    TimeHelper.human_to_seconds("00:15").should == 15
    TimeHelper.human_to_seconds("00:03").should == 3
    TimeHelper.human_to_seconds("04:20").should == 260
    TimeHelper.human_to_seconds("10:11").should == 611
  end

end
