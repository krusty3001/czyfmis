module AlbumsHelper

  MAX_TRACKS_SIZE = 20
  
  def setup_album(album)
    (1..MAX_TRACKS_SIZE).each do |i|
      album.tracks.build(:number_on_album => i) if !album.has_track?(i)
    end
    album
  end
end
