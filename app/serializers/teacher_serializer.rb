class TeacherSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :phone_no
end
