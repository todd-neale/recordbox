class Tag < ApplicationRecord
  belongs_to :box
  belongs_to :record

  validates :record_id, uniqueness: { scope: :box_id }
end
