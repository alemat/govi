import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.indicator = this.element.querySelector(".tabs-indicator")
    this.updateIndicator()
    window.addEventListener("resize", () => this.updateIndicator())
  }

  switch(event) {
    const clicked = event.currentTarget
    const targetId = clicked.dataset.tabTarget

    // Remove active from all tabs
    clicked.parentElement.querySelectorAll("li").forEach(t => t.classList.remove("active"))
    // Remove active from all panes
    this.element.querySelectorAll(".tab-pane").forEach(p => p.classList.remove("active"))

    // Add active to clicked tab and pane
    clicked.classList.add("active")
    this.element.querySelector(`[data-tab-id="${targetId}"]`).classList.add("active")

    // Move the indicator
    this.updateIndicator()
  }

  updateIndicator() {
    const activeTab = this.element.querySelector("li.active")
    if (!activeTab || !this.indicator) return

    const isVertical = this.element.classList.contains("vertical")
    if (isVertical) {
      this.indicator.style.top = activeTab.offsetTop + "px"
      this.indicator.style.height = activeTab.offsetHeight + "px"
    } else {
      // Slide horizontally
      this.indicator.style.left = activeTab.offsetLeft + "px"
      this.indicator.style.width = activeTab.offsetWidth + "px"
    }
  }


}
