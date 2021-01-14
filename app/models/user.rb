class User < ApplicationRecord
  def user_tests(level)
    Test.where("level = :level AND user_id = :id", level: level, id: id)
  end
end
