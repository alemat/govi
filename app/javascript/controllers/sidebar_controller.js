import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["toggleIcon"]

  connect() {}

  toggle(event) {
    event.preventDefault()
    
    if (window.innerWidth <= 768) {
      document.body.classList.toggle("sidebar-open")
    } else {
      document.body.classList.toggle("sidebar-toggled")
    }

    if (this.hasToggleIconTarget) {
      this.toggleIconTarget.classList.toggle("rotated")
    }
  }

  disconnect() {}
}
