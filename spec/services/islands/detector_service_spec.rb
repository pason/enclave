require 'rails_helper'

RSpec.describe Islands::DetectorService, type: :service do
  before :all do
    build_initial_data
    Islands::DetectorService.new(map: @map).call
    @islands_generated = Island.where(map_id: @map.id)
  end

  it "create valid islands for given map" do
    valid_islands_cors = [[[5, 3], [3, 4], [4, 4], [5, 4], [4, 5]], [[1, 1], [2, 1], [2, 2]], [[5, 1]]]

    tiles = @islands_generated.map { |i| i.tiles.map { |t| [t.coordinate_x, t.coordinate_y] } }
    expect(tiles).to eq valid_islands_cors
  end

  it "doesn't create island if such already exist" do
    expect{ Islands::DetectorService.new(map: @map).call }.to_not change{ Island.count }
  end
end
