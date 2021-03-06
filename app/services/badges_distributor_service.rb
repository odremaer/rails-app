class BadgesDistributorService
  include Rules

  RULES = {
    'category' => BadgeCategoryRuleService,
    'level' => BadgeLevelRuleService,
    'first attempt' => BadgeFirstAttemptRuleService
  }.freeze

  def initialize(test_passage)
    @test_passage = test_passage

    self.distribute
  end

  def distribute
    Badge.find_each do |badge|
      rule = RULES[badge.rule_type].new(@test_passage, badge.rule_parameter)
      give_badges_to_user(badge) if rule.satisfies?
    end
  end

  private

  def give_badges_to_user(badge)
    @test_passage.user.badges.push(badge)
  end
end
