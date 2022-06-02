require 'rails_helper'

RSpec.describe 'shelters api' do 

    it 'sends a list of shelters' do 
        data = {attributes: { id: 1,
                        name: "Helpful Shelter",
                        provider: "DHS",
                        address: "123 Main St.",
                        city: "Denver",
                        state: "CO",
                        zipcode: "80201",
                        type: "Youth",
                        sub_type:"Low Barrier",
                        number_of_beds: 10,
                        lgbtq_focused: true,
                        ages_served: "<= 18",
                        how_to_access: "Call or walk in",
                        onsite_medical_clinic: true,
                        website: "helpfulshelter.org"}}

    shelter = Shelter.new(data)

    expect(shelter).to be_an_instance_of(Shelter)

        
        create_list(:shelter, 10)
        
        binding.pry
        get "/api/v1/shelters"

        response_body = JSON.parse(response.body, symbolize_names: true)
        shelters = response_body[:data]

        expect(response).to be_successful
        expect(shelters.count).to eq(10)

        shelters.each do |shelter|
            expect(shelters).to have_key(:id)
            expect(shelters[:id]).to be_a(String)

            expect(shelters[:type]).to eq("shelters")

            expect(shelters[:attributes]).to have_key(:name)
            expect(shelters[:attributes][:name]).to be_a(String)

            expect(shelters[:attributes]).to have_key(:provider)
            expect(shelters[:attributes][:provider]).to be_a(String)

            expect(shelters[:attributes]).to have_key(:address)
            expect(shelters[:attributes][:address]).to be_a(String)
            
            expect(shelters[:attributes]).to have_key(:city)
            expect(shelters[:attributes][:city]).to be_a(String)

            expect(shelters[:attributes]).to have_key(:state)
            expect(shelters[:attributes][:state]).to be_a(String)

            expect(shelters[:attributes]).to have_key(:zipcode)
            expect(shelters[:attributes][:zipcode]).to be_a(String)

            expect(shelters[:attributes]).to have_key(:type)
            expect(shelters[:attributes][:type]).to be_a(String)

            expect(shelters[:attributes]).to have_key(:sub_type)
            expect(shelters[:attributes][:sub_type]).to be_a(String)

            expect(shelters[:attributes]).to have_key(:number_of_beds)
            expect(shelters[:attributes][:number_of_beds]).to be_a(Integer)

            expect(shelters[:attributes]).to have_key(:lgbtq_focused)
            expect(shelters[:attributes][:lgbtq_focused]).to be_a(Boolean)

            expect(shelters[:attributes]).to have_key(:ages_served)
            expect(shelters[:attributes][:ages_served]).to be_an(Integer)

            expect(shelters[:attributes]).to have_key(:how_to_access)
            expect(shelters[:attributes][:how_to_access]).to be_a(String)

            expect(shelters[:attributes]).to have_key(:onsite_medical_clinic)
            expect(shelters[:attributes][:onsite_medical_clinic]).to be_a(Boolean)

            expect(shelters[:attributes]).to have_key(:website)
            expect(shelters[:attributes][:website]).to be_a(String)
        end  
    end    
end 