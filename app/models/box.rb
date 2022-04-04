class Box < ApplicationRecord
  belongs_to :user
  has_many :records, dependent: :destroy

  validates :name, presence: true, uniqueness: true, length: { maximum: 50 }
end
