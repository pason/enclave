class Map < ApplicationRecord
  include Advanon::Presenter

  has_many :tiles, dependent: :destroy
  has_many :islands, dependent: :destroy

  validates :dimension_x_axis, presence: true
  validates :dimension_y_axis, presence: true

  def to_square
    square = Array.new(dimension_y_axis) { Array.new(dimension_x_axis) }
    tiles.each do |tile|
      square[tile.y-1][tile.x-1] = tile.role
    end
    square.reverse
  end
end