class TileSerializer < ActiveModel::Serializer
  attributes :x, :y

  belongs_to :islands
  belongs_to :maps
end