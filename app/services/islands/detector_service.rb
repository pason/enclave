module Islands
  class DetectorService
    attr_reader :map, :lands, :visited

    def initialize(map:)
      @map = map
      @lands = map.tiles.lands.unassigned.to_a
      @visited = []
    end

    def call
      until lands.empty?
        tile = lands.pop
        visit_node(tile)
        Island.new(map: map, tiles: visited).save!
        visited.clear
      end
    end

    private

    def depth_first_search
      lands.each do |land|
        visit_node(land) unless @visited.include? land
      end
    end

    def surroundings(node)
      [find_node(node.coordinate_x - 1, node.coordinate_y),
       find_node(node.coordinate_x + 1, node.coordinate_y),
       find_node(node.coordinate_x, node.coordinate_y - 1),
       find_node(node.coordinate_x, node.coordinate_y + 1)].compact
    end

    def visit_node(node)
      return if node.nil?
      visited << node
      surroundings(node).each { |n| visit_node(n) unless visited.include?(n) }
    end

    def find_node(x, y)
      node = lands.select { |t| t.coordinate_x == x && t.coordinate_y == y }.try(:first)
      return unless node
      lands.delete_at(lands.index(node))
    end
  end
end
