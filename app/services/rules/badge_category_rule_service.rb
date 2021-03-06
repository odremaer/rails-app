class BadgeCategoryRuleService
  def initialize(user, test)
    @user = user
    @test = test
  end

  def performed?
    amount_of_tests_that_user_passed_succesfully_with_certain_category(@user, @test) %
    tests_with_certain_category(@test) == 0
  end

  private

  def amount_of_tests_that_user_passed_succesfully_with_certain_category(user, test)
    user.successfully_passed_tests_by_category(test.category, test).count
  end

  def tests_with_certain_category(test)
    Test.certain_category(test.category.title).count
  end
end
