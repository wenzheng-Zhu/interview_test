class Follow < ApplicationRecord
  validates :teacher_id, presence: true
  validates :student_id, presence: true


  belongs_to :teacher
  belongs_to :student
end
