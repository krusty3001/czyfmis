class AlbumsController < ApplicationController
  before_filter :authenticate_user!, :except => :index
  
  # GET /albums
  def index
    @albums = Album.all
  end

  # GET /albums/user_index
  def user_index
    @albums = current_user.albums.all
  end

  # GET /albums/1
  def show
    @album = Album.find(params[:id])
    @album.comments.build(:user => current_user)
  end

  # GET /albums/new
  def new
    @album = Album.new
  end

  # POST /albums
  def create
    @album = Album.new(params[:album])
    if @album.save
      redirect_to albums_path, :notice => 'Album was successfully created.'
    else
      render :action => "new" 
    end
  end

  # PUT /albums/1
  def update
    @album = Album.find(params[:id])

    if @album.update_attributes(params[:album])
      redirect_to(@album, :notice => 'Album was successfully updated.') 
    else
      render :action => "edit" 
    end
  end

  # GET /albums/upload_cover?id=x
  def upload_cover
    @album = Album.find(params[:id])
  end

  # GET /albums/search
  def search
  end

  # POST /albums/search_index
  def search_index
    @albums = Album.simple_search(params[:searchword])
  end  
  
end
