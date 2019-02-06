class Tile < ApplicationRecord
  belongs_to :map
  belongs_to :island, optional: true

  validates :coordinate_x, presence: true
  validates :coordinate_y, presence: true
  validates :role, presence: true

  ROLES = { land: 1, water: 2 }.freeze

  def self.map_role(role)
    ROLES[role.to_sym]
  end
end