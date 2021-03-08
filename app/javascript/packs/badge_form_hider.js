export default class BadgeFormHider {
  constructor() {
    this.hide()
  }

  hide() {
    const ruleType = document.getElementById('badge_rule_type')
    const ruleParameter = document.querySelector('.rule-parameter')
    ruleType.onchange = function() {
      if (ruleType.value == 'first attempt') {
        ruleParameter.classList.add('hide')
      } else {
        ruleParameter.classList.remove('hide')
      }
    }
  }
}
