class StudentSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :studying_id, :phone_no
end
