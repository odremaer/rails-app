module BadgesHelper
  def create_rule(badge)
    case badge.rule_type
    when 'category'
      content_tag :td, I18n.t('badges.rules.category_rule', category: badge.rule_parameter)
    when 'level'
      content_tag :td, I18n.t('badges.rules.level_rule', level: badge.rule_parameter)
    when 'first attempt'
      content_tag :td, I18n.t('badges.rules.first_attempt_rule')
    end
  end
end
