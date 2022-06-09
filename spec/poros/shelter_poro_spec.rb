require 'rails_helper'

RSpec.describe ShelterPoro do
  it "exists", :vcr do
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

    shelter = ShelterPoro.new(data)

    expect(shelter).to be_an_instance_of(ShelterPoro)
  end
end