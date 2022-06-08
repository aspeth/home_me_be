require "./app/poros/shelter"

class ShelterFacade
  def self.get_all_shelters
    shelters = ShelterService.get_all_shelters

    shelters.map do |shelter|
      Shelter.new(shelter)
    end
  end

  def self.get_shelters_by_zipcode(zipcode)
    shelters = ShelterService.get_shelters_by_zipcode(zipcode)

    shelters.map do |shelter|
      Shelter.new(shelter)
    end
  end

  def self.get_shelter_by_id(id)
    shelter = ShelterService.get_shelter_by_id(id)
    if shelter != []
      Shelter.new(shelter[0])
    else
      shelter
    end
  end
end
