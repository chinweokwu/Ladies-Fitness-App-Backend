require 'rails_helper'

RSpec.describe Excerise, type: :model do
  it { should belongs_to(:workout) }
end
