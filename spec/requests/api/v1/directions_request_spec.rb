require 'rails_helper'

 RSpec.describe 'directions api' do
  it "sends a list of directions from given origin and end points", :vcr do
    get "/api/v1/directions?destination=6010 Georgia Ave., NW Washington, DC 20011&origin=4326 14th Street NW Washington, DC 20011&key=#{ENV['google_maps_key']}"

  end
end
