class Direction
  attr_reader :id, :directions

  def initialize(data)
    @id = nil
    @directions = data[:html_instructions]
  end
end

# data[:routes][0][:legs][0][:steps][0][:html_instructions]
