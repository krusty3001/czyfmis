require 'spec_helper'

describe TracksController do

  before :each do
    sign_in users(:one)
  end
  

  describe "POST search_index" do
    it "assigns the matched tracks as @tracks" do
      post :search_index, :searchword => "secret"
      assigns(:tracks).should eq([tracks(:one)])
    end

    it "assignes empty array if word is not found" do
      post :search_index, :searchword => "adsfdsfdsf"
      assigns(:tracks).should eq([])
    end
  end

end
