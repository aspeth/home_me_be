class Api::V1::DirectionsController < ApplicationController
  def index
    directions = DirectionsFacade.get_all_directions(params[:origin], params[:destination])
    if params[:origin] != ""
      render json: DirectionsSerializer.new(directions)
    else
      render json: directions, status: 400
    end
  end
end

# FE forem gets origin and destination params passed to BE as query params that then get entered as arguments to get_directions and returned as directions , passed back to FE
