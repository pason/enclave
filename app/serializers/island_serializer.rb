class IslandSerializer < ActiveModel::Serializer
  attributes :id, :map_id, :tiles

  has_many :tiles
end