class Api::V1::DirectionsController < ApplicationController
  def index
    directions = DirectionsFacade.get_all_directions(params[:origin], params[:destination])
    render json: DirectionsSerializer.new(directions)#.serialized_json
  end
end

# FE forem gets origin and destination params passed to BE as query params that then get entered as arguments to get_directions and returned as directions , passed back to FE
