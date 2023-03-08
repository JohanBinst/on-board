import { Controller } from "@hotwired/stimulus"
// import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"

// const departure = document.getElementById('departure');

// Connects to data-controller="departure-point"
export default class extends Controller {

  static values = {
    apiKey: String,
    marker: Object
   }

  // static targets = ["point"]

  connect() {
    console.log("16:59")

    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10",
      center: [ this.markerValue.lng, this.markerValue.lat ],
      zoom: 15
    })

    this.map.on('click', (e) => {
      this.#addMarkerToMap(e.lngLat)
    });

    this.marker.on('dragend', onDragEnd);

    // const pin = this.#addMarkerToMap()
    // pin.('dragend', onDragEnd());

  }

  #addMarkerToMap(lngLat) {
    this.marker && this.marker.remove()
    this.marker = new mapboxgl.Marker({
      draggable: true
      })
      .setLngLat(lngLat)
      .addTo(this.map)
  }


  onDragEnd () {
    console.log(marker.getLngLat())
    }

}
