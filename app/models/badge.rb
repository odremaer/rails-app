class Badge < ApplicationRecord
  belongs_to :user, optional: true

  scope :first_badge, -> {find_by(rule: 'Pass all easy levels(0-1)')}
  scope :second_badge, -> {find_by(rule: 'Pass test with only one attempt')}
  scope :third_badge, -> {find_by(rule: 'Pass all tests with Backend category')}

  def self.rules
    ['Pass all easy levels(0-1)', 'Pass test with only one attempt', 'Pass all tests with Backend category']
  end

  def self.first_rule?(user)
    (Test.easy_levels.count == user.passed_tests(0).count) || (Test.easy_levels.count == user.passed_tests(1).count)
  end

  def self.second_rule?(user, test)
    user.tests.where(id: test.id).count == 1
  end

  def self.third_rule?(user, test)
    if test.category.title == "Backend"
      user.tests.where(category_id: test.category.id).count == Test.certain_category(test.category.title).count
    end
  end
end
