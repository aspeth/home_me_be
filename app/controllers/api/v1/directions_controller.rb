class Api::V1::DirectionsController < ApplicationController
  def all_directions
    directions = DirectionsFacade.get_all_directions(start_address, end_address)
    render json: DirectionsSerializer.new(directions)
  end
end

# FE forem gets origin and destination params passed to BE as query params that then get entered as arguments to get_directions and returned as directions , passed back to FE
