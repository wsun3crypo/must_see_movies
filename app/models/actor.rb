require "open-uri"
class Actor < ApplicationRecord
  before_validation :geocode_image

  def geocode_image
    if image.present?
      url = "https://maps.googleapis.com/maps/api/geocode/json?key=#{ENV['GMAP_API_KEY']}&address=#{URI.encode(image)}"

      raw_data = open(url).read

      parsed_data = JSON.parse(raw_data)

      if parsed_data["results"].present?
        self.image_latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]

        self.image_longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]

        self.image_formatted_address = parsed_data["results"][0]["formatted_address"]
      end
    end
  end
  # Direct associations

  has_many   :roles,
             class_name: "Character",
             foreign_key: "actors_id",
             dependent: :destroy

  # Indirect associations

  has_many   :movies,
             through: :roles,
             source: :movie

  # Validations

  # Scopes

  def to_s
    name
  end
end
