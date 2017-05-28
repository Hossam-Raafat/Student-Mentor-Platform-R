# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Student.create!(email: 'a@student.com', password: '12345678', program: 'Fire_up_1')
Question.create!(title: 'Help!', body: 'nevermind', student_id: 1, language: 'ruby')
Question.create!(title: 'Help2!', body: 'nevermind2', student_id: 1, language: 'js')
Question.create!(title: 'Help3!', body: 'please claim me', student_id: 1, language: 'js')
Question.create!(title: 'Help4!', body: 'please claim me too', student_id: 1, language: 'js')
Mentor.create!(email: 'a@mentor.com', password: '12345678', status: true)
Mentor.create!(email: 'b@mentor.com', password: '12345678', status: false)
Mentor.create!(email: 'c@mentor.com', password: '12345678', status: true)
Manager.create!(email: 'a@gmanager.com', password: '12345678')
Manager.create!(email: 'man@gmail.com', password: 'adminadmin')
Response.create!(answer: 'empty', mentor_id: 1 ,status:false, question_id: 1)
Response.create!(answer: 'empty', mentor_id: 2 ,status:false, question_id: 3)
Response.create!(answer: 'this is an another answer', status: true, mentor_id: 1, question_id: 2)
Rate.create!(star: 5, mentor_id: 1, response_id: 1, student_id: 1)
Rate.create!(star: 1, mentor_id: 2, response_id: 2, student_id: 1)
Rate.create!(star: 3, mentor_id: 2, response_id: 3, student_id: 1)
