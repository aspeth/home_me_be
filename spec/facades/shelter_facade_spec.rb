require 'rails_helper'

RSpec.describe ShelterFacade, :vcr do
  describe "all shelters" do
    it "returns an array of all shelters" do
      shelters = ShelterFacade.get_all_shelters
      
      expect(shelters).to be_an(Array)
      expect(shelters.first).to be_an_instance_of(Shelter)
      expect(shelters.last).to be_an_instance_of(Shelter)
    end
  end
end