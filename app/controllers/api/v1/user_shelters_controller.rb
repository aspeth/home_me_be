class Api::V1::UserSheltersController < ApplicationController
  def index
    user = User.find_by(id: params[:id])
    if !user.nil?
      shelters = user.shelters
      render json: ShelterDatabaseSerializer.new(shelters)
    else
      render json: { data: { message: "No match found" } }, status: 400
    end
  end

  def create
    shelter_id = params[:data][0][:shelter_id]
    user_id = params[:data][0][:user_id]
    UserShelter.create!(user_id: user_id, shelter_id: shelter_id)
    render json: { data: { message: "Shelter Saved!" } }, status: 201
  end

  def destroy
    user_id = params[:user_id]
    shelter_id = params[:shelter_id]
    user_shelter = UserShelter.find_by(user_id: user_id, shelter_id: shelter_id)
    user_shelter.destroy
    redirect_to "/api/v1/users/#{user_id}/shelters"
  end
end
