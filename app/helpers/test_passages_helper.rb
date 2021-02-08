module TestPassagesHelper

  def show_results(test_passage)
    success = (test_passage.correct_questions * 100)/test_passage.test.questions.count
    "Процент верных ответов - #{success}"
  end

end
