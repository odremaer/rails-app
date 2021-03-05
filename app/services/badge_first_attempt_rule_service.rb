class BadgeFirstAttemptRuleService < ApplicationService
  def initialize(user, test)
    @user = user
    @test = test
  end

  def call
    @user.successfully_passed_tests(@test).where(id: @test.id).count == 1
  end
end
