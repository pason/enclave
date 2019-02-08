class MapsController < ApplicationController
  
  def create
    client = AdvApi::V1::Client.new
    @map = Maps::CreateService.new(client: client).call
    Islands::DetectorService.new(map: @map).call

    json_response(@map, :created)
  end
end
