# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Teacher.destroy_all
Student.destroy_all
Follow.destroy_all


Teacher.create!([{
                   name: "Jack",
                   phone_no: '11111111111',
                 },
                 {
                   name: "Smith",
                   phone_no: '22222222222',
                 },
                ])


Student.create!([{
                   name: "Jack",
                   phone_no: '11111111111',
                   studying_id: 'asd'
                 },
                 {
                   name: "Smith",
                   phone_no: '22222222222',
                   studying_id: 'ert'
                 },
                ])

t = Teacher.first
s1 = Student.first
s2 = Student.last


Student.create!([{
                   teacher_id: t.id,
                   student_id: s1.id,
                 },
                 {
                   teacher_id: t.id,
                   student_id: s2.id,
                 },
                ])


