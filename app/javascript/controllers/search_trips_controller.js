import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-trips"
export default class extends Controller {
  static targets = [ "form", "input", "searchResults", "recommendations" ]
  connect() {
    console.log("Connected to search-trips controller")
    console.log(this.inputTarget)
  }

  update() {
    console.log("Updating search-trips controller")
    let url = `${this.formTarget.action}?query=${this.inputTarget.value}`
    console.log(url)
    fetch(url, {headers: {"Accept": "text/plain"}})
      .then(response => response.text())
      .then((data) => {
        if (this.inputTarget.value === '') {
          this.searchResultsTarget.innerHTML = "";
          this.recommendationsTarget.classList.remove("d-none")
        } else {
          this.searchResultsTarget.outerHTML = data;
          this.recommendationsTarget.classList.add("d-none")
        }
      })
  }
}
