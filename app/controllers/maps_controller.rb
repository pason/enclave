class MapsController < ApplicationController
  def create
    client = AdvApi::V1::Client.new
    @map = Maps::CreateService.new(client: client).call
    json_response(@map, :created)
  end
end
