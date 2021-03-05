class BadgeLevelRuleService < ApplicationService
  def initialize(user, test)
    @user = user
    @test = test
  end

  def call
    (@user.successfully_passed_tests_by_level(@test.level, @test).count) % (Test.certain_level(@test.level).count) == 0
  end
end
