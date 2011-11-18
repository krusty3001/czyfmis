require 'spec_helper'

describe UsersController do

  describe "GET 'index'" do
    it "assigns all users as @users" do
      get :index
      assigns(:users).should eq([users(:claas), users(:one)])
    end    
  end

end
