class Student < ApplicationRecord
  validates :name, presence: true
  validates :phone_no, presence: true
  validates :studying_id, presence: true, uniqueness: true
end
