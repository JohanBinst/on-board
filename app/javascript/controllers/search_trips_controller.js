import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-trips"
export default class extends Controller {
  static targets = [ "form", "input", "card" ]
  connect() {
  }

  update() {
    let url = `${this.formTarget.action}?query=${this.inputTarget.value}`
    console.log(url)
    fetch(url, {headers: {"Accept": "text/plain"}})
      .then(response => response.text())
      .then((data) => {
        this.cardTarget.outerHTML = data
      })
  }
}
