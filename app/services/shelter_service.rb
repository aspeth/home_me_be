class ShelterService
  def self.get_all_shelters
    response = Faraday.get("https://maps2.dcgis.dc.gov/dcgis/rest/services/DCGIS_DATA/Public_Service_WebMercator/MapServer/25/query?where=1%3D1&outFields=*&outSR=4326&f=json")
    shelters = JSON.parse(response.body, symbolize_names: true)[:features]
  end
end