require 'rails_helper'

RSpec.describe "user shelters API" do
  it "can create new UserShelters" do
    user = User.create!(email: "carl@catmail.com")
    shelter = Shelter.create!(name: "Carl's Castle")
    expect(user.shelters.count).to eq(0)

    request = {
      "data": [
        {
        "shelter_id": shelter.id,
        "user_id": user.id
        }
      ]
    }

    post "/api/v1/user_shelters", params: request, as: :json

    expect(user.shelters).to eq([shelter])
    expect(user.shelters.count).to eq(1)
    expect(response).to have_http_status(:created)
  end

  it "can display saved shelters index for a given user" do
    user1 = User.create!(email: "riley@dogmail.com")
    user2 = User.create!(email: "popp@catmail.com")
    shelter1 = Shelter.create!(name: "Carl's Castle")
    shelter2 = Shelter.create!(name: "Popp's Sandbox")
    shelter3 = Shelter.create!(name: "Margo's Froyo")
    shelter4 = Shelter.create!(name: "Pete's Kitchen")
    user_shelter1 = UserShelter.create!(user_id: user1.id, shelter_id: shelter1.id)
    user_shelter2 = UserShelter.create!(user_id: user1.id, shelter_id: shelter2.id)
    user_shelter3 = UserShelter.create!(user_id: user1.id, shelter_id: shelter3.id)
    user_shelter4 = UserShelter.create!(user_id: user2.id, shelter_id: shelter4.id)

    get "/api/v1/users/#{user1.id}/shelters"

    expect(user1.shelters).to eq([shelter1, shelter2, shelter3])
    expect(user2.shelters).to eq([shelter4])

    shelters = JSON.parse(response.body, symbolize_names: true)[:data]

    shelters.each do |shelter|
      expect(shelter).to have_key(:id)
      expect(shelter).to have_key(:type)
      expect(shelter[:type]).to eq("shelter_database")
      expect(shelter).to have_key(:attributes)
    end
  end
  
  it "can remove saved shelters" do
    user1 = User.create!(email: "riley@dogmail.com")
    user2 = User.create!(email: "popp@catmail.com")
    user1.shelters.create!(name: "Carl's Castle")
    user1.shelters.create!(name: "Popp's Sandbox")
    user1.shelters.create!(name: "Margo's Froyo")
    user2.shelters.create!(name: "Pete's Kitchen")
    
    expect(user1.shelters.first[:name]).to eq("Carl's Castle")
    expect(user1.shelters.second[:name]).to eq("Popp's Sandbox")
    expect(user1.shelters.last[:name]).to eq("Margo's Froyo")
    expect(user2.shelters.first[:name]).to eq("Pete's Kitchen")
    
    delete "/api/v1/users/#{user1.id}/shelters/#{user1.shelters.first.id}"
    
    expect(user1.shelters.first[:name]).to eq("Popp's Sandbox")
    expect(user1.shelters.second[:name]).to eq("Margo's Froyo")
    expect(user2.shelters.first[:name]).to eq("Pete's Kitchen")
    expect(user1.shelters).to_not include("Carl's Castle")
  end

  it "sad path - bad user id" do
    get "/api/v1/users/3000/shelters"

    expect(response.status).to eq(400)
  end
end
