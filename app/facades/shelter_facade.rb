class ShelterFacade
  def self.get_all_shelters
    shelters = ShelterService.get_all_shelters

    shelters.map do |shelter|
      Shelter.new(shelter)
    end
  end
end