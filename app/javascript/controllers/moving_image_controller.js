import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="moving-image"
export default class extends Controller {
  static targets = ["image"]
  static values = { imagePosition : Number }

  connect() {
    // console.log("21:57")
  }

  onScroll() {
    console.log(scrollPercent)
    var scrollYPosition = window.scrollY;
    var maxYScroll = document.documentElement.scrollHeight - window.innerHeight;
    var scrollPercent = scrollYPosition / maxYScroll;

    console.log(scrollPercent * 100)
    if (scrollPercent > 0.85) {
      this.imageTarget.style.width = ((1000 * scrollPercent - 850 ) / 3) + '%';
    }
    else {
      this.imageTarget.style.width = '0%';
    }
  }
}
