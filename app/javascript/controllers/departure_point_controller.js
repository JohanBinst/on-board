import { Controller } from "@hotwired/stimulus"
// import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"

const departure = document.getElementById('trip_departure_point');
const lat = document.getElementById('trip_latitude');
const lng = document.getElementById('trip_longitude');
const first_marker = { lng: 166.45136622553366, lat: -22.272158289730115 }

// Connects to data-controller="departure-point"
export default class extends Controller {

  static values = {
    apiKey: String,
    departurePoints: Object
   }

  static targets = ["lat", "lng"]

  connect() {
    console.log("8:54")

    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10",
      center: [ first_marker.lng, first_marker.lat ],
      zoom: 15
      })
      .addControl(new mapboxgl.NavigationControl());

    departure.onchange = () => {
      console.log(this.departurePointsValue[departure.value])
      const coordinates = [ this.departurePointsValue[departure.value].lng, this.departurePointsValue[departure.value].lat ]
      this.#addMarkerToMap(coordinates)
      this.map.flyTo({
        center: coordinates})
    }

    // this.#addMarkerToMap([ this.markerValue.lng, this.markerValue.lat ])

    // this.marker.on('dragend', () => {
    //   this.getCoordinates(this.marker)
    // });

    this.map.on('click', (e) => {
      // this.first_pin.remove()
      this.#addMarkerToMap(e.lngLat)
    });
    // this.first_pin && this.first_pin.on('dragend', () => {
    //   this.getCoordinates(this.first_pin)
    // });

  }

  #addMarkerToMap(lngLat) {
    this.marker && this.marker.remove()
    this.marker = new mapboxgl.Marker({
      // draggable: true
      })
      .setLngLat(lngLat)
      .addTo(this.map)
    this.getCoordinates(this.marker)
  }

  getCoordinates(mark) {
    console.log(mark.getLngLat())
    lat.value = mark.getLngLat().lat
    lng.value = mark.getLngLat().lng
    // coordinates.style.display = 'block';
    // coordinates.innerHTML = `Longitude: ${lngLat.lng}<br />Latitude: ${lngLat.lat}`;
    }

  // #addFirstMarkerToMap() {
  //   this.marker = new mapboxgl.Marker({
  //     draggable: true
  //     })
  //     .setLngLat([ this.markerValue.lng, this.markerValue.lat ])
  //     .addTo(this.map)
  //   this.getCoordinates(this.marker)
  // }

  // onDragEnd (marker) {
  //   console.log(marker.getLngLat())
  //   getcoordinates(marker)
  //   }

}
