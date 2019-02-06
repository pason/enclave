class Map < ApplicationRecord
  has_many :tiles
  has_many :islands

  validates :dimension_x_axis, presence: true
  validates :dimension_y_axis, presence: true
end