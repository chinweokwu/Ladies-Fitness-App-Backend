class Workout < ApplicationRecord
  has_many :excerises
  belongs_to :user
end
