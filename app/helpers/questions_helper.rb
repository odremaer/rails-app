module QuestionsHelper

  def question_header(test, question)
    if question.persisted?    
      "Edit #{test.title} question"
    else
      "Create new #{test.title} question"
    end
  end

end
