module Rules
  class BadgeFirstAttemptRuleService < AbstractRuleSpecification
    def satisfies?
      amount_of_tests_that_user_passed_succesfully_with_certain_id(@user, @test) == 1
    end

    private

    def amount_of_tests_that_user_passed_succesfully_with_certain_id(user, test)
      successfully_passed_tests(user, test).where(id: test.id).count
    end

    def successfully_passed_tests(user, test)
      Test
        .joins(:test_passages)
        .where(test_passages: { user_id: user.id, correct_questions: test.questions.count })
    end
  end
end
