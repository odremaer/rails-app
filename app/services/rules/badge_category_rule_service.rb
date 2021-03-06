module Rules
  class BadgeCategoryRuleService < AbstractRuleSpecification
    def satisfies?
      amount_of_tests_that_user_passed_succesfully_with_certain_category(@user, @test) %
      tests_with_certain_category(@parameter) == 0
    end

    private

    def amount_of_tests_that_user_passed_succesfully_with_certain_category(user, test)
      successfully_passed_tests_by_category(test.category, test, user).count
    end

    def tests_with_certain_category(parameter)
      Test.certain_category(parameter).count
    end

    def successfully_passed_tests_by_category(category, test, user)
      Test
        .joins(:test_passages)
        .where(category_id: category.id, test_passages: { user_id: user.id, correct_questions: test.questions.count })
    end
  end
end
