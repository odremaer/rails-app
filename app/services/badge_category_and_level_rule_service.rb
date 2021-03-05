class BadgeCategoryAndLevelRuleService < ApplicationService
  def initialize(user, test)
    @user = user
    @test = test
  end

  def call
    ((@user.successfully_passed_tests_by_level(@test.level, @test).count) %
    (Test.certain_level(@test.level).count) == 0) &&
    ((@user.successfully_passed_tests_by_category(@test.category, @test).count) %
    (Test.certain_category(@test.category_title).count) == 0)
  end
end
