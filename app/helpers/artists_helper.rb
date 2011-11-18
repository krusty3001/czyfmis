module ArtistsHelper

  def started_at_values
    (Time.now.year - 100 .. Time.now.year).to_a
  end

  # In a real world app, we would use something like
  # https://github.com/LukeCarrier/rails-country-select
  def country_values
    %w(
      Austria
      Belgium
      Denmark
      Finland
      France
      Germany
      Greece
      Iceland
      Ireland
      Italy
      Netherlands
      Norway
      Portugal
      Spain
      Sweden
      Switzerland
      United Kingdom
      USA
    )
  end
end
