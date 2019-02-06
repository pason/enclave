class MapsController < ApplicationController
  def index
    client = AdvApi::V1::Client.new
    Maps::CreateService.new(client: client).call
  end

  def create
  end
end