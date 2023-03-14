import { Controller } from "@hotwired/stimulus"
// import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"

// Connects to data-controller="departure-point"
export default class extends Controller {
  static values = {
    apiKey: String,
    departurePoints: Object
   }

  static targets = ["lat", "lng", "map", "dpoint"]

  connect() {
    const departure = this.dpointTarget;
    const mapCenter = { lng: 166.45136622553366, lat: -22.272158289730115 };

    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.mapTarget,
      style: "mapbox://styles/mapbox/streets-v10",
      center: [ mapCenter.lng, mapCenter.lat ],
      zoom: 15
      })
      .addControl(new mapboxgl.NavigationControl());


    departure.onchange = () => {
      // console.log(this.departurePointsValue[departure.value])
      const coordinates = [ this.departurePointsValue[departure.value].lng, this.departurePointsValue[departure.value].lat ]
      this.#addMarkerToMap(coordinates)
      this.map.flyTo({
        center: coordinates})
    }

    this.map.on('click', (e) => {
      // this.first_pin.remove()
      this.#addMarkerToMap(e.lngLat)
    });

    // this.marker.on('dragend', () => {
    //   this.getCoordinates(this.marker)
    // });
  }

  #addMarkerToMap(lngLat) {
    this.marker && this.marker.remove()
    this.marker = new mapboxgl.Marker({
      // draggable: true ---> draggable event listener on drag end not working
      })
      .setLngLat(lngLat)
      .addTo(this.map)
    this.getCoordinates(this.marker)
  }

  getCoordinates(mark) {
    console.log(mark.getLngLat())
    this.latTarget.value = mark.getLngLat().lat;
    this.lngTarget.value = mark.getLngLat().lng;
    }

  // onDragEnd (marker) {
  //   console.log(marker.getLngLat())
  //   getcoordinates(marker)
  //   }

}
