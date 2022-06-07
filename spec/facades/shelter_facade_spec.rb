require 'rails_helper'

RSpec.describe ShelterFacade, :vcr do
  describe "all shelters" do
    it "returns an array of all shelters" do
      shelters = ShelterFacade.get_all_shelters

      expect(shelters).to be_an(Array)
      expect(shelters.first).to be_an_instance_of(Shelter)
      expect(shelters.last).to be_an_instance_of(Shelter)
    end

    it "returns an array of all shelters by given zipcode" do
      shelters = ShelterFacade.get_shelters_by_zipcode("20011")

      expect(shelters).to be_an(Array)
      expect(shelters.first).to be_an_instance_of(Shelter)
      expect(shelters.last).to be_an_instance_of(Shelter)
    end

    it "returns a shelter by id" do
      shelter = ShelterFacade.get_shelter_by_id(1)

      expect(shelter).to be_an_instance_of(Shelter)
    end
  end
end
