class Api::V1::FollowsController < ApplicationController
  def create
    teacher = Teacher.find(params[:teacher_id])
    student = Student.find(params[:student_id])
    follow = Follow.find_by(teacher_id: params[:teacher_id], student_id: params[:student_id])
    if follow.nil?
      teacher.students << student
      @follow = Follow.find_by(teacher_id: params[:teacher_id], student_id: params[:student_id])
      response_hash = serializer_hash(@follow, teacher, student)
      response_hash[:message] = 'Followed Successfully!'
      render json: response_hash.to_json, status: :created
    else
      response_hash = serializer_hash(follow, teacher, student)
      response_hash[:message] = 'The teacher has followed this student before!'
      render json: response_hash.to_json, status: :ok
    end

  end

  def serializer
    FollowSerializer
  end

  def serializer_hash(follow, teacher, student)
    hash = serializer.new(follow).to_hash
    hash[:data][:relationships][:teacher][:data][:name] = teacher.name
    hash[:data][:relationships][:teacher][:data][:phone_no] = teacher.phone_no
    hash[:data][:relationships][:student][:data][:name] = student.name
    hash[:data][:relationships][:student][:data][:phone_no] = student.phone_no
    hash[:data][:relationships][:student][:data][:studying_id] = student.studying_id
    hash
  end

end