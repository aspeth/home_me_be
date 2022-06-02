class Api::V1::SheltersController < ApplicationController
  def index
    shelters = ShelterFacade.get_all_shelters
    render json: ShelterSerializer.new(shelters)
  end
end