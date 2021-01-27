class Answer < ApplicationRecord
  scope :correct, -> { where(correct: true) }

  belongs_to :question

  validate :validate_answers_amount
  validates :answer, presence: true

  private

  def validate_answers_amount
    if question.answers.count >= 4
      errors.add(:answer, "amount of answers should be between 1..4")
    end
  end
end
