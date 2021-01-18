class User < ApplicationRecord
  def user_tests(level)
    tests_id = []
    formatted_tests = []
    Result.joins(:user).where("results.user_id = :id", id: id).each { |cur_result| tests_id << cur_result.test_id }
    formatted_tests << tests_id.each { |elem| elem.to_s}
    res = []
    Test.where(id: formatted_tests, level: level).each { |cur_test| res << cur_test.title }
    res
  end
end
