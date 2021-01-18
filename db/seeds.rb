# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def create_qna(test)
  question = Question.create!(body: "vopros po html", test_id: test.id)
  Answer.create!(answer: "otvet na #{question.id} vopros po html", question_id: question.id)
  question = Question.create!(body: "vopros po ruby", test_id: test.id)
  Answer.create!(answer: "otvet na #{question.id} vopros po ruby", question_id: question.id)
end

category = Category.create!(title: "beginner")
user = User.create!(name: "john", password: "qwe")
test = Test.create!(title: "Ruby", category_id: category.id, user_id: user.id)
create_qna(test)
Result.create!(user_id: user.id, test_id:test.id)

test = Test.create!(title: "Rails", category_id: category.id, user_id: user.id)
create_qna(test)
Result.create!(user_id: user.id, test_id:test.id)

category = Category.create!(title: "intermediate")
user = User.create!(name: "paul", password: "123")
test = Test.create!(title: "HTML", level: 1, category_id: category.id, user_id: user.id)
create_qna(test)
Result.create!(user_id: user.id, test_id:test.id)
