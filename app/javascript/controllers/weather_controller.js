import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="weather"
export default class extends Controller {
  static targets = [
    "temperature",
    "description",
    "wind",
    "icon"
  ]

  connect() {
    console.log("Weather controller connected!");
    // console.log(process.env.OPENWEATHER_API_KEY);
    // this.apiKey = ENV['OPENWEATHER_API_KEY'];
    // console.log(this.cityTarget)
    // console.log(this.temperatureTarget)
   const url = `https://api.openweathermap.org/data/2.5/weather?q=Noumea&appid=ab1f709ccccd367fd3003c74f9c8d745&units=metric`
   fetch(url)
   .then(response => response.json())
   .then(data => this.#updateCard(data))
  };

  #updateCard(data) {
      this.descriptionTarget.insertAdjacentText("beforeend", data.weather[0].description),
      this.temperatureTarget.insertAdjacentText("beforeend", `${Math.round(data.main['temp'])} °C`),
      this.windTarget.insertAdjacentText("beforeend", `${Math.round(data.wind['speed'] * 3.6)} km/h`)
  };
}
