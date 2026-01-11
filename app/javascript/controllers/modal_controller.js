import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["container"]

  connect() {
    this.keydownHandler = (e) => {
      if (e.key === "Escape") this.close()
    }
    document.addEventListener("keydown", this.keydownHandler)
  }

  disconnect() {
    document.removeEventListener("keydown", this.keydownHandler)
  }

  open(event) {
    if (event) event.preventDefault()
    this.containerTarget.classList.add("show")
    document.body.classList.add("modal-open")
  }

  close(event) {
    if (event) event?.preventDefault()
    this.containerTarget.classList.remove("show")
    document.body.classList.remove("modal-open")
  }
}
