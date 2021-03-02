// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
// Sort
import Sort from 'packs/utilities/sorting'
window.Sort = Sort
// Password confirmation
import PasswordConfirmation from 'packs/utilities/password_confirmation'
window.PasswordConfirmation = PasswordConfirmation

import 'packs/utilities/form_inline'

Rails.start()
Turbolinks.start()
ActiveStorage.start()
