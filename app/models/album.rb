class Album < ActiveRecord::Base
  belongs_to :artist
  has_many :tracks, :order => "number_on_album ASC"

  validates :artist, :title, :presence => true
  
  has_attached_file :cover, :styles => { :medium => "300x300>",
    :thumb => "100x100>" }

  acts_as_commentable

  accepts_nested_attributes_for :tracks, :reject_if => :reject_track
  accepts_nested_attributes_for :comments, :reject_if => :reject_comment

  
  def saved_comments
    comments.reject { |c| !c.created_at }
  end

  def sorted_tracks
    tracks.sort_by(&:number_on_album)
  end
  
  def has_track?(number_on_album)
    !!tracks.detect { |t| t.number_on_album == number_on_album }
  end

  # See comment for Track#simple_search
  def Album.simple_search(searchword)
    sql = "%" + searchword + "%"
    Album.includes(:artist).where(
      ["upper(albums.title) like upper(?) or upper(artists.name) like upper(?)",
       sql, sql])    
  end
  
  private

  def reject_track(attributes)
    attributes["title"].blank? && attributes["playtime"].blank?
  end

  def reject_comment(attributes)
    attributes["comment"].blank?
  end
end
