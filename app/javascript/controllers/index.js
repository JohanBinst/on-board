// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import DeparturePointController from "./departure_point_controller"
application.register("departure-point", DeparturePointController)

import FlatpickrController from "./flatpickr_controller"
application.register("flatpickr", FlatpickrController)

import HelloController from "./hello_controller"
application.register("hello", HelloController)

import MapController from "./map_controller"
application.register("map", MapController)

import MasonryController from "./masonry_controller"
application.register("masonry", MasonryController)

import MovingImageController from "./moving_image_controller"
application.register("moving-image", MovingImageController)

import NavbarController from "./navbar_controller"
application.register("navbar", NavbarController)

import PriceCalculatorController from "./price_calculator_controller"
application.register("price-calculator", PriceCalculatorController)

import SearchTripsController from "./search_trips_controller"
application.register("search-trips", SearchTripsController)

import WeatherController from "./weather_controller"
application.register("weather", WeatherController)
