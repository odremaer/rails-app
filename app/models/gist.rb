class Gist < ApplicationRecord
  belongs_to :question

  def question_body
    self.question.body
  end
end
