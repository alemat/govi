import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["menu"]

  connect() {
    this.boundClickOutside = this.clickOutside.bind(this)
  }

  toggle(event) {
    event.preventDefault()
    this.menuTarget.classList.toggle("show")

    if (this.menuTarget.classList.contains("show")) {
      document.addEventListener("click", this.boundClickOutside)
    } else {
      document.removeEventListener("click", this.boundClickOutside)
    }
  }

  clickOutside(event) {
    if (!this.element.contains(event.target)) {
      this.menuTarget.classList.remove("show")
      document.removeEventListener("click", this.boundClickOutside)
    }
  }

  disconnect() {
    document.removeEventListener("click", this.boundClickOutside)
  }
}
