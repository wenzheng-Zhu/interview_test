# README



This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version:
  Ruby "3.0.0"
  Rails 7.0.4.3

* System dependencies
  Ref Gemfile.lock

* Database creation
  Run command 'rails db:create'

* Database initialization
  1. Can run command 'rails db:seed' to initialize the data
  2. If the command fail, you can run 'rails c' to get to the rails console, and then you can create some data there. 
  3. Data structure can ref 'schema.rb'
  
* How to run the test suite
  Run the command 'rails s -p xxx'
  
* APIs:
1. Teacher can follow a student.
  Post http://localhost:3000/api/v1/follows
  params:  teacher_id, student_id
  eg: post http://localhost:3000/api/v1/follows?student_id=1&teacher_id=1
  
2. Teacher can unfollow a student.
   Delete http://localhost:3000/api/v1/unfollow
   params: teacher_id, student_id
   eg: http://localhost:3000/api/v1/unfollow?teacher_id=1&student_id=1
   
3. Can list specific teacher's followed students.
   Get http://localhost:3000/api/v1/teachers/specific_teacher_students
   params: teacher_id
   eg: http://localhost:3000/api/v1/teachers/specific_teacher_students?teacher_id=1
   
* How to run the test suite
  I commit four branches, they are 'teacher_and_student_model_creating', 'teacher_follow_student_feature', 'teacher_unfollow_student_featureeach' and 'list_specific_teacher_followed_students_feature', each branch solve one api.
  

