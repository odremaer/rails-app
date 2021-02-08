module TestPassagesHelper

  def test_passed_successfully?(test_passage)
    if success_rate(test_passage) >= 85
      true
    else
      false
    end
  end

  def success_rate(test_passage)
    (test_passage.correct_questions * 100)/test_passage.amount_of_questions_in_test
  end

end
