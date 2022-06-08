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
  end
end