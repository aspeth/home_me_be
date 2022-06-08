require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:user_shelters) }
  it { should have_many(:shelters).through(:user_shelters) }
end
