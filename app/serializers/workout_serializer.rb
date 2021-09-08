class WorkoutSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :img_url
  has_many :excerises
end
