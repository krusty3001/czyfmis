class ArtistsController < ApplicationController
  before_filter :authenticate_user!
  
  # GET /artists/1
  def show
    @artist = Artist.find(params[:id])
  end

  # GET /artists/new
  def new
    @artist = Artist.new
  end

  # POST /artists
  def create
    @artist = Artist.new(params[:artist])
    @artist.user = current_user

    if @artist.save
      flash[:notice] = 'Artist was successfully created.'
      redirect_to :action => "thank_you"
    else
      render :action => "new" 
    end
  end

  def thank_you
  end
end
