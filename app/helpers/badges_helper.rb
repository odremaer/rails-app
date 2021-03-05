module BadgesHelper
  def create_rule(badge)
    if badge.contains_category_and_level_rule?
      content_tag :td, I18n.t('badges.rules.category_and_level_rule', level: badge.level, category: badge.category)
    elsif badge.contains_category_rule?
      content_tag :td, I18n.t('badges.rules.category_rule', category: badge.category)
    elsif badge.contains_level_rule?
      content_tag :td, I18n.t('badges.rules.level_rule', level: badge.level)
    elsif badge.contains_first_attempt_rule?
      content_tag :td, I18n.t('badges.rules.first_attempt_rule')
    end
  end
end
