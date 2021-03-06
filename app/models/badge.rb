class Badge < ApplicationRecord
  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges, dependent: :destroy

  validate :validate_first_attempt_absence_if_category_or_level_picked
  validate :validate_if_attrs_are_empty
  validates :title, presence: true
  IMAGES = Dir.children(Rails.root.join('app', 'assets', 'images', 'badges').to_s)

  def contains_level_rule?
    level.present?
  end

  def contains_category_rule?
    category.present?
  end

  def contains_category_and_level_rule?
    category.present? && level.present?
  end

  def contains_first_attempt_rule?
    first_attempt
  end

  private

  def validate_first_attempt_absence_if_category_or_level_picked
    if first_attempt == true && (category.present? || level.present?)
      errors.add(:badge, I18n.t('badges.errors.first_attempt_with_other_attrs'))
    end
  end

  def validate_if_attrs_are_empty
    if category.blank? && level.blank? && first_attempt.blank?
      errors.add(:badge, I18n.t('badges.errors.empty_attr'))
    end
  end
end
