class Directions
  attr_reader :directions

  def initialize(data)
    @directions = data[:html_instructions]
  end
end
