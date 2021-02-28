class PasswordConfirmation {
  constructor(form) {
    this.form = form
    this.password = form.elements.user_password
    this.password_confirmation = form.elements.user_password_confirmation

    this.setup()
  }

  resetStyleForInputs() {
    this.password_confirmation.classList.remove('input-green')
    this.password_confirmation.classList.remove('input-red')
    this.password_confirmation.parentElement.classList.remove('success')
    this.password_confirmation.parentElement.classList.remove('error')
  }

  checkPasswords() {
    this.resetStyleForInputs()

    if(this.password_confirmation.value === this.password.value) {
      this.password_confirmation.classList.add('input-green')
      this.password_confirmation.parentElement.classList.add('success')
    } else {
      this.password_confirmation.classList.add('input-red')
      this.password_confirmation.parentElement.classList.add('error')
    }
  }

  setup() {
    this.form.addEventListener('keyup', event => {
      if(this.password.value != '') this.checkPasswords()
    })
  }
}

const reg_form = document.getElementById("new_user")
if (reg_form) new PasswordConfirmation(reg_form)
