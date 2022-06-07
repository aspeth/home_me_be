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
end
