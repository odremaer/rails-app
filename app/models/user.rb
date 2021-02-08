class User < ApplicationRecord
  has_many :written_tests, class_name: 'Test', dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages, dependent: :destroy

  validates :name, :password, presence: true

  def passed_tests(level)
    Test
      .joins(:test_passages)
      .where(level: level, test_passages: { user_id: id })
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
