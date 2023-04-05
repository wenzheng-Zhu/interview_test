class Teacher < ApplicationRecord
  validates :name, presence: true
  validates :phone_no, presence: true, uniqueness: true

  has_many :follows
  has_many :students, through: :follows
end
