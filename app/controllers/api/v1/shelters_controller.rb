class Api::V1::SheltersController < ApplicationController
  def index
    if params[:ZIPCODE] == nil
      shelters = ShelterFacade.get_all_shelters
      render json: ShelterSerializer.new(shelters)
    else
      shelters = ShelterFacade.get_shelters_by_zipcode(params[:ZIPCODE])
      render json: ShelterSerializer.new(shelters)
    end
  end
end
