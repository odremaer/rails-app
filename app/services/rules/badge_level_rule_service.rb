class BadgeLevelRuleService
  def initialize(user, test)
    @user = user
    @test = test
  end

  def performed?
    amount_of_tests_that_user_passed_succesfully_with_certain_level(@user, @test) % tests_with_certain_level(@test) == 0
  end

  private

  def amount_of_tests_that_user_passed_succesfully_with_certain_level(user, test)
    user.successfully_passed_tests_by_level(test.level, test).count
  end

  def tests_with_certain_level(test)
    Test.certain_level(test.level).count
  end
end
