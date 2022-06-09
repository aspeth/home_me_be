require 'rails_helper'

RSpec.describe Shelter, type: :model do
  describe "relationships" do
    it { should have_many(:user_shelters) }
    it { should have_many(:users).through(:user_shelters) }
  end

  describe "validations" do
    it { should validate_presence_of(:name) }
  end
end
