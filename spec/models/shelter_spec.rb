require 'rails_helper'

RSpec.describe Shelter, type: :model do
  it { should have_many(:user_shelters) }
  it { should have_many(:users).through(:user_shelters) }
end
