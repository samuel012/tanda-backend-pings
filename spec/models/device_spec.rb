require 'rails_helper'

RSpec.describe Device, type: :model do

  # ----------------------------------------------------
  # Association test

  # ensure Device model has a 1:m relationship with the Ping model
  it { should have_many(:pings).dependent(:destroy) }

  # ----------------------------------------------------
  # Validation tests

  # ensure column identifier is present before saving
  it { should validate_presence_of(:identifier) }

end
