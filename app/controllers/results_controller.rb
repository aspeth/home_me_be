class ResultsController < ApplicationController
  def all_shelters
    ShelterFacade.get_all_shelters
  end
end