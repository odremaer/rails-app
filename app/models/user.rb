class User < ApplicationRecord
  def passed_tests(level)
    Test.where("level = :level", level: level).\
    joins("INNER JOIN 'results' ON 'results'.'test_id' = 'tests'.'id'").\
    where("results.user_id = :id", id: id).pluck(:title)
  end
end
