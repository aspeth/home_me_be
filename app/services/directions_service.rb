class DirectionsService < BaseService
    def self.get_all_directions(start_address, end_address)
        response = conn("https://maps.googleapis.com").get("/maps/api/directions/json?destination=#{end_address}&origin=#{start_address}&key=#{ENV["google_maps_key"]}")
        get_json(response)
    end
end
