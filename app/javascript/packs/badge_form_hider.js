document.addEventListener('turbolinks:load', () =>{
  const ruleType = document.getElementById('badge_rule_type')
  if (ruleType) {
    ruleType.onchange = function() {
      if (ruleType.value == 'first attempt') {
        let ruleParameter = document.querySelector('.rule-parameter')
        ruleParameter.classList.add('hide')
      } else {
        let ruleParameter = document.querySelector('.rule-parameter')
        ruleParameter.classList.remove('hide')
      }
    }
  }
})
