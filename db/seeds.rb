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

categories = Category.create!([
  {title: "beginner"},
  {title: "intermediate"}
])

tests = Test.create!([
  {title: "Ruby", category_id: categories[0].id, user_id: users[0].id},
  {title: "Rails", category_id: categories[0].id, user_id: users[0].id},
  {title: "HTML", level: 1, category_id: categories[1].id, user_id: users[1].id}
])

#Ruby
question = Question.create!(body: "В какому году появился Ruby? ", test_id: tests[0].id)
Answer.create!([
  {answer: "2000", question_id: question.id},
  {answer: "1995", question_id: question.id, correct: true},
  {answer: "1990", question_id: question.id}
])

question = Question.create!(body: "Какое расширение у файлов Ruby?", test_id: tests[0].id)
Answer.create!([
  {answer: "rb", question_id: question.id, correct: true},
  {answer: "exe", question_id: question.id},
  {answer: "c", question_id: question.id}
])

question = Question.create!(body: "Что делает #unshift с массивом?", test_id: tests[0].id)
Answer.create!([
  {answer: "Добавляет элементы в начало массива", question_id: question.id, correct: true},
  {answer: "Добавляет элементы в конец массива", question_id: question.id},
  {answer: "Очищает массив", question_id: question.id}
])

#Rails
question = Question.create!(body: "Как проверить статус миграций?", test_id: tests[1].id)
Answer.create!([
  {answer: "rails db:migrate", question_id: question.id},
  {answer: "rails db:migrate:status", question_id: question.id, correct: true},
  {answer: "rails db:status", question_id: question.id}
])

question = Question.create!(body: "С помощью какой команды можно откатить последнюю миграцию?", test_id: tests[1].id)
Answer.create!([
  {answer: "rails db:reset", question_id: question.id},
  {answer: "rails db:revert", question_id: question.id},
  {answer: "rails db:rollback", question_id: question.id, correct: true}
])

question = Question.create!(body: "Какая база данных стоит в Rails по умолчанию?", test_id: tests[1].id)
Answer.create!([
  {answer: "PostgreSQL", question_id: question.id},
  {answer: "MySQL", question_id: question.id},
  {answer: "SQLite", question_id: question.id, correct: true}
])

#HTML
question = Question.create!(body: "Какой тег нужно добавить для переноса строки?", test_id: tests[2].id)
Answer.create!([
  {answer: "<br>", question_id: question.id, correct: true},
  {answer: "<ol>", question_id: question.id},
  {answer: "<div>", question_id: question.id}
])

question = Question.create!(body: "С помощью какого тега в HTML создаются ссылки?", test_id: tests[2].id)
Answer.create!([
  {answer: "<p>", question_id: question.id},
  {answer: "<url>", question_id: question.id},
  {answer: "<a>", question_id: question.id, correct: true}
])

question = Question.create!(body: "Каким является следующий адрес ссылки: /page2.html", test_id: tests[2].id)
Answer.create!([
  {answer: "<Относительным>", question_id: question.id, correct: true},
  {answer: "<Абсолютным>", question_id: question.id},
  {answer: "<Нет верного ответа>", question_id: question.id}
])



Result.create!([
  {user_id: users[0].id, test_id: tests[0].id},
  {user_id: users[0].id, test_id: tests[1].id},
  {user_id: users[1].id, test_id: tests[2].id}
])
