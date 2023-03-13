import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {
  static values = {
    ypos: {
      type: Number,
      default: 350
    }
  }
  connect() {
    console.log('Hello')
  }

  onScroll(e) {
    const scrollPos = window.scrollY
    if (scrollPos > this.yposValue) {
      this.element.style.background = 'white'
    } else {
      this.element.style.background = 'transparent'
    }
  }
}
