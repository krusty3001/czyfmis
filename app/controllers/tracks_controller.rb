class TracksController < ApplicationController
  before_filter :authenticate_user!  

  # POST tracks/search_index
  def search_index
    @tracks = Track.simple_search(params[:searchword])
  end  

end
