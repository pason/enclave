module Maps
  class CreateService
    attr_reader :client

    def initialize(client:)
      @client = client
    end

    def call
      map = Map.new

      client.map.parsed_response["attributes"]["tiles"].each do |tile|
        map.tiles.build(coordinate_x: tile['x'], coordinate_y: tile['y'], role: Tile.map_role(tile['type']))
      end

      map.dimension_x_axis = 1
      map.dimension_y_axis = 1
     
      map.save!
    end
  end
end
