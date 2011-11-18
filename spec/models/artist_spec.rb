require 'spec_helper'

describe Artist do

  it "should be valid when name is present" do
    Artist.new(:name => "Feist").should be_valid
  end
  
  it "should be invalid when name is missing" do
    Artist.new.should be_invalid
  end
end
