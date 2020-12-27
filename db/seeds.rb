# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Category.create(title: "beginner")
Test.create(title: "Ruby", category_id: 1)
Question.create(body: "vopros po ruby 1", test_id: 1)
Question.create(body: "vopros po ruby 2", test_id: 1)
Answer.create(answer: "otvet na 1 vopros po ruby")
Answer.create(answer: "otvet na 2 vopros po ruby")

Category.create(title: "admin")
User.create(name: "administrator", password: 'qwe', category_id: 2)

Category.create(title: "user")
User.create(name: "john", password: 'qwe', category_id: 3)
