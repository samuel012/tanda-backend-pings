require 'rails_helper'

RSpec.describe Ping, type: :model do
  
  # ----------------------------------------------------
  # Association test

  # ensure a ping record belongs to a single device record
  it { should belong_to(:device) }
  
  # ----------------------------------------------------
  # Validation tests

  # ensure columns device_id and datetimestamp are present before saving
  # it { should validate_presence_of(:device_id) }
  it { should validate_presence_of(:datetimestamp) }

end
