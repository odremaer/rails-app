class TestPassage < ApplicationRecord
  belongs_to :test
  belongs_to :user
  belongs_to :current_question, class_name: "Question", optional: true

  before_validation :before_validation_set_first_question, on: :create

  before_update :before_update_set_next_question

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end

    save!
  end

  def amount_of_questions_in_test
    self.test.questions.count
  end

  def current_question_number
    self.test.questions.pluck(:body).index(current_question_body)
  end

  def current_question_body
    self.current_question.body
  end
  
  private

  def before_validation_set_first_question
    self.current_question = test.questions.first
  end

  def correct_answer?(answer_ids)
    if answer_ids.nil?
      false
    else
      correct_answers.ids.sort == answer_ids.map(&:to_i).sort
    end
  end

  def correct_answers
    current_question.answers.correct
  end

  def before_update_set_next_question
    self.current_question = test.questions.order(:id).where('id > ?', current_question.id).first
  end
end
