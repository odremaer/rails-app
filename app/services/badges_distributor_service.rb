class BadgesDistributorService
  def initialize(user, test)
    @user = user
    @test = test
    @test_category = @test.category.title
    @test_level = @test.level

    self.distribute
  end

  def distribute
    if @test_category.present? && @test_level.present?
      if BadgeCategoryAndLevelRuleService.call(@user, @test)
        badge = Badge.where(category: @test_category, level: @test_level)
        @user.badges.push(badge)
      end
    else
      if @test_category.present?
        if BadgeCategoryRuleService.call(@user, @test)
          badge = Badge.where(category: @test_category)
          @user.badges.push(badge)
        end
      end

      if @test_level.present?
        if BadgeLevelRuleService.call(@user, @test)
          badge = Badge.where(level: @test_level)
          @user.badges.push(badge)
        end
      end
    end

    if BadgeFirstAttemptRuleService.call(@user, @test)
      badge = Badge.where(first_attempt: true)
      @user.badges.push(badge)
    end
  end

end
