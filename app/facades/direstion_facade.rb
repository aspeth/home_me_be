require "./app/poros/direction"

class DirectionFacade
  def self.get_all_directions(start_address, end_address)
    directions = DirectionsService.get_all_directions(start_address, end_address)

    directions.map do |direction|
      Directions.new(directions)
    end
  end
end
