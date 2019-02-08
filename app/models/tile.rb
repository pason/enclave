class Tile < ApplicationRecord
  belongs_to :map
  belongs_to :island, optional: true

  validates :coordinate_x, presence: true, uniqueness: { scope: [:map_id, :coordinate_y] }
  validates :coordinate_y, presence: true, uniqueness: { scope: [:map_id, :coordinate_x] }
  validates :role, presence: true

  ROLES = { land: 1, water: 2 }.freeze

  scope :lands, -> { where(role: ROLES[:land]) } 
  scope :unassigned, -> { where(island_id: nil) }

  alias_attribute :x, :coordinate_x
  alias_attribute :y, :coordinate_y

  def self.map_role(role)
    ROLES[role.to_sym]
  end

  def has_role?(value)
    role == value
  end
end