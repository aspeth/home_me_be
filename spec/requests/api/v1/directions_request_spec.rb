require 'rails_helper'

 RSpec.describe 'directions api' do
  it "sends a list of directions from given origin and end points", :vcr do

    get "/api/v1/directions?destination=6010 Georgia Ave., NW Washington, DC 20011&origin=4326 14th Street NW Washington, DC 20011&key=#{ENV['google_maps_key']}"

    response_body = JSON.parse(response.body, symbolize_names: true)
    directions = response_body[:data]

    expect(response).to be_successful
    expect(directions.count).to eq(4)

    directions.each do |direction|
      expect(direction).to have_key(:id)
      expect(direction[:id]).to be(nil)

      expect(direction[:type]).to eq("directions")

      expect(direction[:attributes]).to have_key(:directions)
      expect(direction[:attributes][:directions]).to be_a(String)
    end
  end
end
