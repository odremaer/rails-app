class TestPassage < ApplicationRecord
  SUCCESS_BORDER = 85

  belongs_to :test
  belongs_to :user
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create

  before_update :before_update_set_next_question

  def completed?
    current_question.nil? || @test_passage.time_for_test <= 0
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)

    save!
  end

  def amount_of_questions_in_test
    self.test.questions.count
  end

  def current_question_number
    self.test.questions.pluck(:body).index(current_question_body) + 1
  end

  def current_question_body
    current_question.body
  end

  def successfully?
    success_rate >= SUCCESS_BORDER
  end

  def success_rate
    (self.correct_questions * 100) / amount_of_questions_in_test
  end

  def time_for_test
    if self.test.time.present?
      (self.created_at + self.test.time.to_i * 60) - Time.now
    end
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first
  end

  def correct_answer?(answer_ids)
    return false if answer_ids.nil?

    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def before_update_set_next_question
    self.current_question = test.questions.order(:id).where('id > ?', current_question.id).first
  end
end
