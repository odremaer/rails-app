class Badge < ApplicationRecord
  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges, dependent: :destroy

  validate :validate_first_attempt_absence_if_category_or_level_picked
  validate :validate_if_attrs_are_empty
  validates :title, presence: true

  IMAGES = Dir.children(Rails.root.join('app', 'assets', 'images', 'badges').to_s)
  RULE_TYPES = ['category', 'level', 'first attempt'].freeze

  def contains_level_rule?
    rule_type == 'level'
  end

  def contains_category_rule?
    rule_type == 'category'
  end

  def contains_first_attempt_rule?
    rule_type == 'first attempt'
  end

  private

  # if user dont have js enabled
  def validate_first_attempt_absence_if_category_or_level_picked
    if contains_first_attempt_rule? && rule_parameter.present?
      errors.add(:badge, I18n.t('badges.errors.first_attempt_with_other_attrs'))
    end
  end

  def validate_if_attrs_are_empty
    unless rule_type == 'first attempt'
      errors.add(:badge, I18n.t('badges.errors.empty_attr')) if rule_parameter.blank?
    end
  end
end
