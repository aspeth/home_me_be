require 'rails_helper'

RSpec.describe DirectionsFacade do
  describe "directions" do
    it "returns an array of all directions", :vcr do
      start_address = "4326 14th Street NW Washington, DC 20011"
      end_address = "6010 Georgia Ave., NW Washington, DC 20011"
      directions = DirectionsFacade.get_all_directions(start_address, end_address)

      expect(directions).to be_an(Array)
      expect(directions.first).to be_an_instance_of(Direction)
      expect(directions.last).to be_an_instance_of(Direction)
    end
  end
end
