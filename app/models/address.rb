class Address < ApplicationRecord
  belongs_to :post

  # Validates existence of a location
  validates :location, :name, presence: true

  # Geocode location to coordinates
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
