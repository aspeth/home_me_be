require 'rails_helper'

RSpec.describe "user shelters API" do
  it "can create new UserShelters" do
    user = User.create!(name: "Carl", email: "carl@catmail.com")
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
  end

  it "can display saved shelters index for a given user" do
    user1 = User.create!(name: "Carl", email: "carl@catmail.com")
    user2 = User.create!(name: "Popp", email: "popp@catmail.com")
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
  end
end
