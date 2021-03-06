module Rules
  class AbstractRuleSpecification

    def initialize(test_passage, parameter)
      @test_passage = test_passage
      @test = @test_passage.test
      @user = @test_passage.user
      @parameter = parameter
    end

    def satisfies?
      raise "#{__method__} not defined for #{self.class}"
    end
  end
end
