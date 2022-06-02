class Shelter
  attr_reader :id, :name, :provider, :address, :city, :state, :zipcode, :full_address, :type, :sub_type, :number_of_beds, :lgbtq_focused, :ages_served, :how_to_access, :onsite_medical_clinic, :website

  def initialize(data)
    @id = data[:attributes][:OBJECTID]
    @name = data[:attributes][:NAME]
    @provider = data[:attributes][:PROVIDER]
    @address = data[:attributes][:ADDRESS]
    @city = data[:attributes][:CITY]
    @state = data[:attributes][:STATE]
    @zipcode = data[:attributes][:ZIPCODE]
    @full_address = "#{@address} #{@city}, #{@state} #{@zipcode}"
    @type = data[:attributes][:TYPE]
    @sub_type = data[:attributes][:SUBTYPE]
    @number_of_beds = data[:attributes][:NUMBER_OF_BEDS]
    @lgbtq_focused = data[:attributes][:LGBTQ_FOCUSED]
    @ages_served = data[:attributes][:AGES_SERVED]
    @how_to_access = data[:attributes][:HOW_TO_ACCESS]
    @onsite_medical_clinic = data[:attributes][:ON_SITE_MEDICAL_CLINIC]
    @website = data[:attributes][:WEB_URL]
  end
end