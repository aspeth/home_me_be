require "./app/poros/direction"

class DirectionsFacade
  def self.get_all_directions(start_address, end_address)
    directions = DirectionsService.get_all_directions(start_address, end_address)

    directions[:routes][0][:legs][0][:steps].map do |direction|
      Direction.new(direction)
    end
  end
end
