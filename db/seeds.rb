# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

taha = Student.create(email: 'a@student.com', password: '12345678', program: 'Fire_up_1')
taha.questions.create(title: 'test', body: 'body test', language: 'ruby')
Mentor.create(email: 'a@mentor.com', password: '12345678')
Manager.create(email: 'a@gmanager.com', password: '12345678')
