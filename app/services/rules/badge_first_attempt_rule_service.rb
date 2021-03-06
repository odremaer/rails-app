class BadgeFirstAttemptRuleService
  def initialize(user, test)
    @user = user
    @test = test
  end

  def performed?
    amount_of_tests_that_user_passed_succesfully_with_certain_id(@user, @test) == 1
  end

  private

  def amount_of_tests_that_user_passed_succesfully_with_certain_id(user, test)
    user.successfully_passed_tests(test).where(id: test.id).count
  end
end
