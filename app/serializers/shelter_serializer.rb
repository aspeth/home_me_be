class ShelterSerializer
  include JSONAPI::Serializer
  attributes :name, :provider, :address, :city, :state, :zipcode, :full_address, :shelter_type, :sub_type, :number_of_beds, :lgbtq_focused, :ages_served, :how_to_access, :onsite_medical_clinic, :website
end
