require 'rails_helper'

RSpec.describe Excerise, type: :model do
  it { should belong_to(:workout) }
end
