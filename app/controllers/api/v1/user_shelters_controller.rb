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
    parsed_params = JSON.parse(params["{\"data\":"].keys[0], symbolize_names: true)
    shelter_id = parsed_params[:shelter_id]
    user_id = parsed_params[:user_id]
    User.find_or_create_by(email: parsed_params[:user_email])
    Shelter.find_or_create_by(id: shelter_id, name: "Notashelter")
    UserShelter.create!(user_id: parsed_params[:user_id], shelter_id: parsed_params[:shelter_id])
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
