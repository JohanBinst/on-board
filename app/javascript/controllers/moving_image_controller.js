import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="moving-image"
export default class extends Controller {
  static targets = ["image"]

  connect() {
    // console log image target
    console.log("21:57")
    // console.log(this.imageTarget.style.left)
    const image = this.imageTarget;
    const maxHeight = 85;
    window.addEventListener("scroll", function() {
      var scrollPosition = window.scrollY;
      var imagePosition = (scrollPosition / 100 ) * window.innerWidth;
      // console.log(scrollPosition);
      if (maxHeight > scrollPosition && scrollPosition >= 0) {
        image.style.left = imagePosition + 'px';
        }
      else ( image.style.left = (window.innerWidth - 200) + 'px')
    })
  }

  // onScroll() {
  //   var scrollPosition = window.scrollY
  //   var imagePosition = (scrollPosition / 100 ) * window.innerWidth
  //   // console.log(scrollPosition)
  //   if (maxHeight > scrollPosition && scrollPosition >= 0) {
  //     image.style.left = imagePosition + 'px'
  //     }
  // }
}
