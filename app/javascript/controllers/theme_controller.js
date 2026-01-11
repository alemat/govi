import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.applyTheme()
  }

  toggle(event) {
    event.preventDefault()

    const html = document.documentElement
    const next = html.dataset.theme === "dark" ? "light" : "dark"

    html.dataset.theme = next
    localStorage.setItem("theme", next)
  }

  applyTheme = () => {
    const stored = localStorage.getItem("theme")
    const html = document.documentElement

    if (stored) {
      html.dataset.theme = stored
    } else {
      // Only default to OS preference on first visit
      html.dataset.theme = window.matchMedia("(prefers-color-scheme: dark)").matches ? "dark" : "light"
    }
  }
}
