require 'rails_helper'

RSpec.describe 'shelters api' do

  it 'sends a list of shelters', :vcr do

    get "/api/v1/shelters"

    response_body = JSON.parse(response.body, symbolize_names: true)
    shelters = response_body[:data]
    
    expect(response).to be_successful
    expect(shelters.count).to eq(18)

    shelters.each do |shelter|
        expect(shelter).to have_key(:id)
        expect(shelter[:id]).to be_a(String)

        expect(shelter[:type]).to eq("shelter")

        expect(shelter[:attributes]).to have_key(:name)
        expect(shelter[:attributes][:name]).to be_a(String)

        expect(shelter[:attributes]).to have_key(:provider)
        expect(shelter[:attributes][:provider]).to be_a(String)

        expect(shelter[:attributes]).to have_key(:address)
        expect(shelter[:attributes][:address]).to be_a(String)

        expect(shelter[:attributes]).to have_key(:city)
        expect(shelter[:attributes][:city]).to be_a(String)

        expect(shelter[:attributes]).to have_key(:state)
        expect(shelter[:attributes][:state]).to be_a(String)

        expect(shelter[:attributes]).to have_key(:zipcode)
        expect(shelter[:attributes][:zipcode]).to be_a(String)

        expect(shelter[:attributes]).to have_key(:shelter_type)
        expect(shelter[:attributes][:shelter_type]).to be_a(String)

        expect(shelter[:attributes]).to have_key(:sub_type)
        expect(shelter[:attributes][:sub_type]).to be_a(String)

        expect(shelter[:attributes]).to have_key(:number_of_beds)
        expect(shelter[:attributes][:number_of_beds]).to be_a(Float)

        expect(shelter[:attributes]).to have_key(:lgbtq_focused)
        expect(shelter[:attributes][:lgbtq_focused]).to be_a(String)

        expect(shelter[:attributes]).to have_key(:ages_served)
        expect(shelter[:attributes][:ages_served]).to be_an(String)

        expect(shelter[:attributes]).to have_key(:how_to_access)
        expect(shelter[:attributes][:how_to_access]).to be_a(String)

        expect(shelter[:attributes]).to have_key(:onsite_medical_clinic)
        expect(shelter[:attributes][:onsite_medical_clinic]).to be_a(String)

        expect(shelter[:attributes]).to have_key(:website)
        expect(shelter[:attributes][:website]).to be_a(String)
    end
  end
end
