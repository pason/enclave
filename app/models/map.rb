class Map < ApplicationRecord
  has_many :tiles, dependent: :destroy
  has_many :islands, dependent: :destroy

  validates :dimension_x_axis, presence: true
  validates :dimension_y_axis, presence: true
end