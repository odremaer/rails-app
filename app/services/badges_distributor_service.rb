require 'rules/badge_category_rule_service'
require 'rules/badge_first_attempt_rule_service'
require 'rules/badge_level_rule_service'

class BadgesDistributorService
  def initialize(user, test)
    @user = user
    @test = test
    @test_category = @test.category.title
    @test_level = @test.level

    self.distribute
  end

  def distribute
    category_rule = BadgeCategoryRuleService.new(@user, @test)
    level_rule = BadgeLevelRuleService.new(@user, @test)
    first_attempt_rule = BadgeFirstAttemptRuleService.new(@user, @test)


    if category_rule.performed?
      badge = find_badge_for_category_rule(@test_category)
      @user.badges.push(badge)
    end

    if level_rule.performed?
      badge = find_badge_for_level_rule(@test_level)
      @user.badges.push(badge)
    end

    if first_attempt_rule.performed?
      badge = find_badge_for_first_attempt_rule
      @user.badges.push(badge)
    end
  end

  private

  def find_badge_for_category_rule(test_category)
    Badge.where(rule_type: 'category', rule_parameter: test_category)
  end

  def find_badge_for_level_rule(test_level)
    Badge.where(rule_type: 'level', rule_parameter: test_level)
  end

  def find_badge_for_first_attempt_rule
    Badge.where(rule_type: 'first attempt')
  end
end
