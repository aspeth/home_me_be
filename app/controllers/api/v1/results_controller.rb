class Api::V1::ResultsController < ApplicationController
  def all_shelters
    shelters = ShelterFacade.get_all_shelters
    render json: ShelterSerializer.new(shelters)
  end
end