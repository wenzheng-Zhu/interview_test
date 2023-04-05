class Api::V1::TeachersController < ApplicationController
  def specific_teacher_students
    teacher = Teacher.find_by(id: params[:teacher_id])
    students = teacher&.students
    if teacher
      render json: serializer.new(students), status: :ok
    else
      render json: {
        message: 'Check please, could not find the teacher!'
      }
    end
  end

  def serializer
    StudentSerializer
  end
end