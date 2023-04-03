class Teacher < ApplicationRecord
  validates :name, presence: true
  validates :phone_no, presence: true, uniqueness: true
end
