module QuestionsHelper

  def question_header(test, question)
    if question.body.blank?
      "Create new #{test.title} question"
    else
      "Edit #{test.title} question"
    end
  end

end
