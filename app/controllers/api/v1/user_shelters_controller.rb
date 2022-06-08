class Api::V1::UserSheltersController < ApplicationController
  def index
    user = User.find_by(id: params[:id])
    shelters = user.shelters
    render json: ShelterDatabaseSerializer.new(shelters)
  end

  def create
    shelter_id = params[:data][0][:shelter_id]
    user_id = params[:data][0][:shelter_id]
    UserShelter.create!(user_id: user_id, shelter_id: shelter_id)
  end
end
