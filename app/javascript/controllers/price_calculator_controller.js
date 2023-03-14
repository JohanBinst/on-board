import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="price-calculator"
export default class extends Controller {
  static targets = [ "totalPrice", "numberOfSpots" ]
  static values = { price: Number }

  connect() {
    console.log("Price calculator controller connected");
    console.log("Price is " + this.priceValue);
    console.log("Number of spots is " + this.numberOfSpotsTarget);

  }

  calculateTotalPrice() {
    this.totalPriceTarget.innerHTML = "$" + this.priceValue * this.numberOfSpotsTarget.value + " AUD";
  }
}
