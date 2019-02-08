class Island < ApplicationRecord
  has_many :tiles
  belongs_to :map

  validates :map_id, presence: true
end