import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="map"
export default class extends Controller {
  static values = {
    apiKey: String,
    marker: Object
  }

  connect() {
    console.log(this.markersValue)

    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10",
      center: [ this.markerValue.lng, this.markerValue.lat ],
      zoom: 17
    })

    this.map.addControl(new mapboxgl.NavigationControl());

    this.#addMarkerToMap()
  }

  #addMarkerToMap() {
    new mapboxgl.Marker()
      .setLngLat([ this.markerValue.lng, this.markerValue.lat ])
      .addTo(this.map)
  }




}
