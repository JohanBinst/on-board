import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-trips"
export default class extends Controller {
  static targets = [ "form", "input", "row" ]
  connect() {
  }

  update() {
    // console.log(this.formTarget.action)
    // console.log(this.inputTarget.value)
    // let url;
    // if (this.inputTarget.value.length > 0){
       let url = `${this.formTarget.action}?query=${this.inputTarget.value}`
       console.log(url)
       fetch(url, {headers: {"Accept": "text/plain"}})
         .then(response => response.text())
         .then((data) => {
           this.rowTarget.outerHTML = data
         })
    // }
  }
}
