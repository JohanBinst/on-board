import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {
  onScroll(e) {
    const scrollPos = window.scrollY
    if (scrollPos > this.yposValue) {
      this.element.style.background = 'white'
    } else {
      this.element.style.background = 'transparent'
    }
  }
}
