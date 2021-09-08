require 'rails_helper'

RSpec.describe Workout, type: :model do
  it { should have_many(:excerises) }
end
