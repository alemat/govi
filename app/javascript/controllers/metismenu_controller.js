import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {}

  toggle(event) {
    event.preventDefault()
    const link = event.currentTarget
    const li = link.closest("li")
    const submenu = link.nextElementSibling

    if (!submenu) return

    // Toggle active class on li
    li.classList.toggle("active")

    // Toggle submenu visibility
    submenu.classList.toggle("show")

    // Close other submenus at same level
    const otherLis = li.parentElement.querySelectorAll(":scope > li")
    otherLis.forEach(otherLi => {
      if (otherLi !== li) {
        otherLi.classList.remove("active")
        const otherSub = otherLi.querySelector("ul.collapse")
        if (otherSub) otherSub.classList.remove("show")
      }
    })
  }
}
