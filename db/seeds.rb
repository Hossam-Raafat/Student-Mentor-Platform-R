# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Student.create(email: 'a@student.com', password: '12345678')
Question.create(title: 'Help!', body: 'nevermind', student_id: 1, language: 'ruby')
Question.create(title: 'Help2!', body: 'nevermind2', student_id: 1, language: 'js')
Mentor.create(email: 'a@mentor.com', password: '12345678')
Manager.create(email: 'a@gmanager.com', password: '12345678')
Manager.create(email: 'man@gmail.com', password: 'adminadmin')
Response.create(answer: 'empty', mentor_id: 1 ,status:false, question_id: 1)
Response.create(answer: 'this is an another answer', status: true, mentor_id: 1, question_id: 2)
