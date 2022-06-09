require 'rails_helper'

RSpec.describe UserShelter, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:shelter) }
end
