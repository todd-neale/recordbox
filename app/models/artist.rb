class Artist < ApplicationRecord
  has_many :tracks
  has_many :records, through: :tracks

  validates :name, presence: true
end
