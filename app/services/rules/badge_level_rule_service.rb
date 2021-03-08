module Rules
  class BadgeLevelRuleService < AbstractRuleSpecification
    def satisfies?
      amount_of_tests_that_user_passed_succesfully_with_certain_level(@user, @test) %
      tests_with_certain_level(@parameter) == 0
    end

    private

    def amount_of_tests_that_user_passed_succesfully_with_certain_level(user, test)
      successfully_passed_tests_by_level(test.level, test, user).count
    end

    def tests_with_certain_level(parameter)
      Test.certain_level(parameter).count
    end

    def successfully_passed_tests_by_level(level, test, user)
      Test
        .joins(:test_passages)
        .where(level: level, test_passages: { user_id: user.id, correct_questions: test.questions.count })
    end
  end
end
