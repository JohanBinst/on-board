import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="moving-image"
export default class extends Controller {
  static targets = ["image"]
  static values = { imagePosition : Number }

  connect() {
    // console log image target
    console.log("21:57")
    // console.log(this.imageTarget.style.left)

    const image = this.imageTarget.innerHTML;
    console.log(image)
    // const maxHeight = 85;
    window.addEventListener("scroll", function() {
      this.document.documentElement.clientHeight
      var scrollPosition = window.scrollY;
      var maxScroll = document.body.scrollHeight - window.innerHeight;
      var scrollPercent = scrollPosition / maxScroll;
      var windowWidth = this.document.documentElement.clientWidth;
      var imagePosition = scrollPercent * windowWidth / 2;
      // var info = {
      //   scrollPosition: scrollPosition,
      //   imagePosition: imagePosition,
      //   scrollPercent: scrollPercent,
      //   maxScroll: maxScroll
      // }
      console.log(image.style.left);
      // if (scrollPercent > 0.85 ) {
      //   image.style.left = imagePosition + 'px';
      // } else if (scrollPercent > 0.95) {
      //   image.style.left = (windowWidth / 2) + 'px'
      // }
    });

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
