require 'rails_helper'

RSpec.describe DirectionsService do
  it "gets all directions", :vcr do

    start_address = "4326 14th Street NW Washington, DC 20011"
    end_address = "6010 Georgia Ave., NW Washington, DC 20011"

    directions = DirectionsService.get_all_directions(start_address, end_address)

    expect(directions).to be_an(Hash)
    expect(directions[:routes][0][:legs][0]).to have_key(:steps)
    expect(directions[:routes][0][:legs][0][:steps]).to be_a(Array)
  end
end
