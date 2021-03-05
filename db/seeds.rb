# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



users = User.create!([
  {email: "john@gmail.com", password: '123123', password_confirmation: '123123'},
  {email: "paul@gmail.com", password: 'qweqwe', password_confirmation: 'qweqwe'},
  {type: 'Admin', email: 'admin@admin.ru', password: '123123', password_confirmation: '123123'}
])

categories = Category.create!([
  {title: "Backend"},
  {title: "Frontend"}
])

tests = Test.create!([
  {title: "Ruby", category: categories[0], user: users[0]},
  {title: "Rails", category: categories[0], user: users[0]},
  {title: "HTML", level: 1, category: categories[1], user: users[1]}
])

#Ruby
questions = Question.create!([
  {body: "В какому году появился Ruby? ", test: tests[0]},
  {body: "Какое расширение у файлов Ruby?", test: tests[0]},
  {body: "Что делает #unshift с массивом?", test: tests[0]}
  ])

Answer.create!([
  {answer: "2000", question: questions[0]},
  {answer: "1995", question: questions[0], correct: true},
  {answer: "1990", question: questions[0]},

  {answer: "rb", question: questions[1], correct: true},
  {answer: "exe", question: questions[1]},
  {answer: "c", question: questions[1]},

  {answer: "Добавляет элементы в начало массива", question: questions[2], correct: true},
  {answer: "Добавляет элементы в конец массива", question: questions[2]},
  {answer: "Очищает массив", question: questions[2]}
])

#Rails
questions = Question.create!([
  {body: "Как проверить статус миграций?", test: tests[1]},
  {body: "С помощью какой команды можно откатить последнюю миграцию?", test: tests[1]},
  {body: "Какая база данных стоит в Rails по умолчанию?", test: tests[1]}
  ])

Answer.create!([
  {answer: "rails db:migrate", question: questions[0]},
  {answer: "rails db:migrate:status", question: questions[0], correct: true},
  {answer: "rails db:status", question: questions[0]},

  {answer: "rails db:reset", question: questions[1]},
  {answer: "rails db:revert", question: questions[1]},
  {answer: "rails db:rollback", question: questions[1], correct: true},

  {answer: "PostgreSQL", question: questions[2]},
  {answer: "MySQL", question: questions[2]},
  {answer: "SQLite", question: questions[2], correct: true}
])

#HTML
questions = Question.create!([
  {body: "Какой тег нужно добавить для переноса строки?", test: tests[2]},
  {body: "С помощью какого тега в HTML создаются ссылки?", test: tests[2]},
  {body: "Каким является следующий адрес ссылки: /page2.html", test: tests[2]}
  ])

Answer.create!([
  {answer: "<br>", question: questions[0], correct: true},
  {answer: "<ol>", question: questions[0]},
  {answer: "<div>", question: questions[0]},

  {answer: "<p>", question: questions[1]},
  {answer: "<url>", question: questions[1]},
  {answer: "<a>", question: questions[1], correct: true},

  {answer: "<Относительным>", question: questions[2], correct: true},
  {answer: "<Абсолютным>", question: questions[2]},
  {answer: "<Нет верного ответа>", question: questions[2]}
])

# Badges
Badge.create!([
  {title: "All easy levels passed!", image_title: 'level_up.jpg', level: 0},
  {title: "Passed test with one attempt!", image_title: 'qr.png', first_attempt: true},
  {title: "Passed all tests in Backend category", image_title: 'fist.jpg', category: categories[0].title, level: 0}
  ])
