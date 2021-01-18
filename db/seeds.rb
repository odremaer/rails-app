# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def create_qna(test)
  question = Question.create!(body: "Вопрос по HTML", test_id: test.id)
  Answer.create!(answer: "Ответ на #{question.id} вопрос по HTML", question_id: question.id)
  question = Question.create!(body: "Вопрос по Ruby", test_id: test.id)
  Answer.create!(answer: "Ответ на #{question.id} вопрос по Ruby", question_id: question.id)
end

first_user = User.create!(name: "john", password: "qwe")
second_user = User.create!(name: "paul", password: "123")

first_category = Category.create!(title: "beginner")
second_category = Category.create!(title: "intermediate")


first_test = Test.create!(title: "Ruby", category_id: first_category.id, user_id: first_user.id)
second_test = Test.create!(title: "Rails", category_id: first_category.id, user_id: first_user.id)
third_test = Test.create!(title: "HTML", level: 1, category_id: second_category.id, user_id: second_user.id)

create_qna(first_test)
create_qna(second_test)
create_qna(third_test)

Result.create!(user_id: first_user.id, test_id: first_test.id)
Result.create!(user_id: first_user.id, test_id: second_test.id)
Result.create!(user_id: second_user.id, test_id: third_test.id)
