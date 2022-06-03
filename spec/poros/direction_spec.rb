require 'rails_helper'

RSpec.describe Direction do
  it "exists", :vcr do
    data = { attributes: { directions: "Turn right" }}

    direction = Direction.new(data)

    expect(direction).to be_an_instance_of(Direction)
  end
end
