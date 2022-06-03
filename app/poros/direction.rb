class Direction
  attr_reader :directions

  def initialize(data)
    @directions = data
  end
end

# data[:routes][0][:legs][0][:steps][0][:html_instructions]
