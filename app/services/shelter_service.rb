class ShelterService < BaseService
  def self.get_all_shelters
    response = conn("https://maps2.dcgis.dc.gov").get("/dcgis/rest/services/DCGIS_DATA/Public_Service_WebMercator/MapServer/25/query?where=1%3D1&outFields=*&outSR=4326&f=json")
    get_json(response)[:features]
  end
end