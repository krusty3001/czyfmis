require 'spec_helper'

describe AlbumsController do

  before :each do
    sign_in users(:one)
  end
  
  def valid_attributes
    { :artist => artists(:feist), :title => "Metals" }
  end

  describe "GET index" do
    it "assigns all albums as @albums" do
      get :index
      assigns(:albums).should eq([albums(:reminder), albums(:bad)])
    end
  end

  describe "GET user_index" do
    it "assigns user's albums as @albums" do
      get :user_index
      assigns(:albums).should eq([albums(:reminder)])
    end
  end
  
  describe "GET show" do
    it "assigns the requested album as @album" do
      get :show, :id => albums(:reminder).id
      assigns(:album).should eq(albums(:reminder))
      assigns(:album).should have(1).comment
    end
  end

  describe "GET new" do
    it "assigns a new album as @album" do
      get :new
      assigns(:album).should be_a_new(Album)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Album" do
        expect {
          post :create, :album => valid_attributes
        }.to change(Album, :count).by(1)
      end

      it "assigns a newly created album as @album" do
        post :create, :album => valid_attributes
        assigns(:album).should be_a(Album)
        assigns(:album).should be_persisted
      end

      it "redirects to index" do
        post :create, :album => valid_attributes
        response.should redirect_to(:action => "index")
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved album as @album" do
        # Trigger the behavior that occurs when invalid params are submitted
        Album.any_instance.stub(:save).and_return(false)
        post :create, :album => {}
        assigns(:album).should be_a_new(Album)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Album.any_instance.stub(:save).and_return(false)
        post :create, :album => {}
        response.should render_template("new")
      end
    end
  end

  describe "GET upload_cover" do
    it "assigns the requested album as @album" do
      get :upload_cover, :id => albums(:reminder).id
      assigns(:album).should eq(albums(:reminder))
    end    
  end

  describe "POST search_index" do
    it "assigns the matched albums as @album" do
      post :search_index, :searchword => "reminder"
      assigns(:albums).should eq([albums(:reminder)])
    end
  end

end
