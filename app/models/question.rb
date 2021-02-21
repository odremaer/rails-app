class Question < ApplicationRecord
  belongs_to :test
  has_many :answers, dependent: :destroy

  validates :body, presence: true


  def without_answers?
    self.answers.empty?
  end
end
