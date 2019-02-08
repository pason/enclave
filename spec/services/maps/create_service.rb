require 'spec_helper'

RSpec.describe Maps::CreateService, type: :service do
  before :each do
    client = AdvApi::V1::Client.new
    @map = Maps::CreateService.new(client: client).call
  end

  it 'creates map' do
    expect(@map).to be_kind_of(Map)
  end

  it 'assigns maps dimesions' do
    expect(@map.dimension_x_axis).to eq(6)
    expect(@map.dimension_y_axis).to eq(5)
  end

  it 'creates tiles' do
    expect(@map.tiles).to_not be_nil
  end
end
