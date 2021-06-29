class ExceriseSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :img_url, :workout_id
  belongs_to :workout
end
