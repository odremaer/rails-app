# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



users = User.create!([
  {name: "john", password: "qwe"},
  {name: "paul", password: "123"}
])
first_user = users[0]
second_user = users[1]

categories = Category.create!([
  {title: "beginner"},
  {title: "intermediate"}
])
first_category = categories[0]
second_category = categories[1]

tests = Test.create!([
  {title: "Ruby", category_id: first_category.id, user_id: first_user.id},
  {title: "Rails", category_id: first_category.id, user_id: first_user.id},
  {title: "HTML", level: 1, category_id: second_category.id, user_id: second_user.id}
])
first_test = tests[0]
second_test = tests[1]
third_test = tests[2]

#Ruby
question = Question.create!(body: "В какому году появился Ruby? ", test_id: first_test.id)
Answer.create!([
  {answer: "2000", question_id: question.id},
  {answer: "1995", question_id: question.id, correct: true},
  {answer: "1990", question_id: question.id}
])

question = Question.create!(body: "Какое расширение у файлов Ruby?", test_id: first_test.id)
Answer.create!([
  {answer: "rb", question_id: question.id, correct: true},
  {answer: "exe", question_id: question.id},
  {answer: "c", question_id: question.id}
])

question = Question.create!(body: "Что делает #unshift с массивом?", test_id: first_test.id)
Answer.create!([
  {answer: "Добавляет элементы в начало массива", question_id: question.id, correct: true},
  {answer: "Добавляет элементы в конец массива", question_id: question.id},
  {answer: "Очищает массив", question_id: question.id}
])

#Rails
question = Question.create!(body: "Как проверить статус миграций?", test_id: second_test.id)
Answer.create!([
  {answer: "rails db:migrate", question_id: question.id},
  {answer: "rails db:migrate:status", question_id: question.id, correct: true},
  {answer: "rails db:status", question_id: question.id}
])

question = Question.create!(body: "С помощью какой команды можно откатить последнюю миграцию?", test_id: second_test.id)
Answer.create!([
  {answer: "rails db:reset", question_id: question.id},
  {answer: "rails db:revert", question_id: question.id},
  {answer: "rails db:rollback", question_id: question.id, correct: true}
])

question = Question.create!(body: "Какая база данных стоит в Rails по умолчанию?", test_id: second_test.id)
Answer.create!([
  {answer: "PostgreSQL", question_id: question.id},
  {answer: "MySQL", question_id: question.id},
  {answer: "SQLite", question_id: question.id, correct: true}
])

#HTML
question = Question.create!(body: "Какой тег нужно добавить для переноса строки?", test_id: third_test.id)
Answer.create!([
  {answer: "<br>", question_id: question.id, correct: true},
  {answer: "<ol>", question_id: question.id},
  {answer: "<div>", question_id: question.id}
])

question = Question.create!(body: "С помощью какого тега в HTML создаются ссылки?", test_id: third_test.id)
Answer.create!([
  {answer: "<p>", question_id: question.id},
  {answer: "<url>", question_id: question.id},
  {answer: "<a>", question_id: question.id, correct: true}
])

question = Question.create!(body: "Каким является следующий адрес ссылки: /page2.html", test_id: third_test.id)
Answer.create!([
  {answer: "<Относительным>", question_id: question.id, correct: true},
  {answer: "<Абсолютным>", question_id: question.id},
  {answer: "<Нет верного ответа>", question_id: question.id}
])



Result.create!([
  {user_id: first_user.id, test_id: first_test.id},
  {user_id: first_user.id, test_id: second_test.id},
  {user_id: second_user.id, test_id: third_test.id}
])
