class User < ApplicationRecord
  has_many :written_tests, class_name: "Test", dependent: :destroy
  has_many :results, dependent: :destroy
  has_many :tests, through: :results, dependent:  :destroy
  def passed_tests(level)
    Test
    .joins(:results)
    .where(level: level, results: { user_id: id })
  end
end
