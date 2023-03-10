import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {
  connect() {
    console.log('Hello')
  }

  onScroll(e) {
    console.log(window.scrollY)
    const scrollPos = window.scrollY
    if (scrollPos > 450) {
      this.element.style.background = 'white'
    } else {
      this.element.style.background = 'transparent'
    }
  }
}
