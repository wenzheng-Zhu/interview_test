class TeacherSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :phone_no
  has_many :students, through: :follows
end
