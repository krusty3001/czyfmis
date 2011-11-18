class Track < ActiveRecord::Base
  belongs_to :album

  validates :playtime, :format => { :with => /^\d?\d:[012345]\d$/,
    :message => "must be in format mm:ss" }

  # This very simple search method returns a match whenever the input is
  # substring of title or artist name. For short inputs, this might return
  # many matches. The idea is that too many matches are more convenient
  # than too less matches.
  # Of course the proper solution would be to use a real search engine
  # which includes stemming etc.
  def Track.simple_search(searchword)
    sql = "%" + searchword + "%"
    Track.includes(:album => :artist).where(
      ["upper(tracks.title) like upper(?) or upper(artists.name) like upper(?)",
       sql, sql])    
  end
end
