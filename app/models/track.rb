class Track < ApplicationRecord
  belongs_to :artist
  belongs_to :record

  validates :artist_id, presence: true
  validates :record_id, presence: true
end
