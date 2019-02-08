module Fixtures
  def build_initial_data
    build_map
    build_tiles
  end

  def build_map
    @map = FactoryBot.create(:map)
  end

  def build_tiles
    @tiles = []
    data_response[:attributes][:tiles].each do |tile|
      @tiles << FactoryBot.create(:tile, coordinate_x: tile[:x], coordinate_y: tile[:y], role: Tile.map_role(tile[:type]), map: @map)
    end
  end

  def data_response
      {
        data: {
            id: "imaginary",
            type: "map",
            links: {
                self: "https://private-2e8649-advapi.apiary-mock.com/map"
            }
        },
        attributes: {
            tiles: [
                { "x": 1, "y": 1, "type": "land" },
                { "x": 2, "y": 1, "type": "land" },
                { "x": 3, "y": 1, "type": "water" },
                { "x": 4, "y": 1, "type": "water" },
                { "x": 5, "y": 1, "type": "land" },
                { "x": 6, "y": 1, "type": "water" },
                { "x": 1, "y": 2, "type": "water" },
                { "x": 2, "y": 2, "type": "land" },
                { "x": 3, "y": 2, "type": "water" },
                { "x": 4, "y": 2, "type": "water" },
                { "x": 5, "y": 2, "type": "water" },
                { "x": 6, "y": 2, "type": "water" },
                { "x": 1, "y": 3, "type": "water" },
                { "x": 2, "y": 3, "type": "water" },
                { "x": 3, "y": 3, "type": "water" },
                { "x": 4, "y": 3, "type": "water" },
                { "x": 5, "y": 3, "type": "land" },
                { "x": 6, "y": 3, "type": "water" },
                { "x": 1, "y": 4, "type": "water" },
                { "x": 2, "y": 4, "type": "water" },
                { "x": 3, "y": 4, "type": "land" },
                { "x": 4, "y": 4, "type": "land" },
                { "x": 5, "y": 4, "type": "land" },
                { "x": 6, "y": 4, "type": "water" },
                { "x": 1, "y": 5, "type": "water" },
                { "x": 2, "y": 5, "type": "water" },
                { "x": 3, "y": 5, "type": "water" },
                { "x": 4, "y": 5, "type": "land" },
                { "x": 5, "y": 5, "type": "water" },
                { "x": 6, "y": 5, "type": "water" }
            ]
        }
    }
  end
end