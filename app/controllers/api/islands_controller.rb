class Api::IslandsController < ApplicationController 
  def index
    @islands = Island.all
    json_response(@islands)
  end

  def show
    @island = Island.find(params[:id])
    json_response(@island)
  end
end