class IndexController < ApplicationController 
  def index
    render plain: "API version 1.0 \n POST api/maps \n GET api/maps/:id \n GET api/islands \n GET api/islands/:id"
  end
end