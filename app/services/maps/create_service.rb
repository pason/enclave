module Maps
  class CreateService
    attr_reader :client, :tiles

    def initialize(client:)
      @client = client
    end

    def call
      map = Map.new
      map.tiles.build(tiles_params)
      determine_dimension(map)
      map.save!
      map
    end

    private

    def fetch_tiles
      tiles ||= client.map.parsed_response['attributes']['tiles']
    end

    def tiles_params
      fetch_tiles.map do |tile|
        {
          coordinate_x: tile['x'], 
          coordinate_y: tile['y'], 
          role: Tile.map_role(tile['type'])
        }
      end
    end

    def determine_dimension(map)
      map.dimension_x_axis = fetch_tiles.map { |t| t['x'] }.max
      map.dimension_y_axis = fetch_tiles.map { |t| t['y'] }.max
    end
  end
end
