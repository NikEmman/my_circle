import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["input", "submit", "warning"]

    connect() {
        this.checkInput()
    }

    checkInput() {
        const textLength = this.inputTarget.value.length

        if (textLength > 500) {
            this.inputTarget.style.borderColor = 'red'
            this.warningTarget.textContent = 'Your text is too long!'
        } else {
            this.inputTarget.style.borderColor = 'inherit'
            this.warningTarget.textContent = ''
        }

        this.submitTarget.disabled = textLength > 500
    }
}
