require 'spec_helper'

describe ArtistsController do

  before :each do
    sign_in users(:one)
  end
  
  def valid_attributes
    { :name => "Feist" }
  end

  
  describe "GET show" do
    it "assigns the requested artist as @artist" do
      artist = Artist.create! valid_attributes
      get :show, :id => artist.id
      assigns(:artist).should eq(artist)
    end
  end
  
  describe "GET new" do
    it "assigns a new artist as @artist" do
      get :new
      assigns(:artist).should be_a_new(Artist)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Artist" do
        expect {
          post :create, :artist => valid_attributes
        }.to change(Artist, :count).by(1)
      end

      it "assigns a newly created artist as @artist" do
        post :create, :artist => valid_attributes
        assigns(:artist).should be_a(Artist)
        assigns(:artist).should be_persisted
      end

      it "redirects to the created artist" do
        post :create, :artist => valid_attributes
        response.should redirect_to(:action => "thank_you")
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved artist as @artist" do
        # Trigger the behavior that occurs when invalid params are submitted
        Artist.any_instance.stub(:save).and_return(false)
        post :create, :artist => {}
        assigns(:artist).should be_a_new(Artist)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Artist.any_instance.stub(:save).and_return(false)
        post :create, :artist => {}
        response.should render_template("new")
      end
    end
  end

end
