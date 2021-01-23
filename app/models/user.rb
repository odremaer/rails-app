class User < ApplicationRecord
  has_many :written_tests, class_name: "Test"
  has_many :results
  has_many :tests, through: :results
  def passed_tests(level)
    Test
    .joins("JOIN results ON tests.id = results.test_id")
    .where(level: level, results: { user_id: id })
  end
end
