FactoryBot.define do
    factory :shelter do
        attributes[:name] {Faker::Books::Lovecraft.deity}
        attributes[:provider] {Faker::Books::Lovecraft.tome}
        attributes[:address] {Faker::Address.street_name}
        attributes[:city] {Faker::Books::Lovecraft.location} 
        attributes[:state] {Faker::Address.state }
        attributes[:zipcode] {Faker::Address.zip}
        attributes[:full_address] {Faker::Address.full_address}
        attributes[:type] {Faker::Gender.binary_type}
        attributes[:sub_type] {Faker::Gender.short_binary_type}
        attributes[:number_of_beds] { Faker::Number.within(range: 0..20) }
        attributes[:lgbtq_focused] {Faker::Boolean.boolean}
        attributes[:ages_served] { Faker::Number.within(range: 1..65) }
        attributes[:how_to_access] {Faker::TvShows::Simpsons.quote}
        attributes[:onsite_medical_clinic] {Faker::Boolean.boolean}
        attributes[:website] {Faker::Internet.domain_name}    
      
      initialize_with { new(attributes) }
    end
  end 

  
