class FollowSerializer
  include FastJsonapi::ObjectSerializer
  attributes :teacher_id, :student_id, :created_at, :updated_at
  belongs_to :teacher
  belongs_to :student
end
