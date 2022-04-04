class Record < ApplicationRecord
  validates :title, presence: true, uniqueness: true

  include PgSearch::Model
    pg_search_scope :search_by_title,
      against: :title,
      using: {
        tsearch: { prefix: true }
      }
end
