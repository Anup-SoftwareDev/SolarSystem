//
//  PlanetDataService.swift
//  SolarSystem
//
//  Created by Anup Kuriakose on 2/11/2023.
//

import Foundation

struct PlanetDataService {
    static let planets = [
        //Planet(name: "Sun", image: "Sun", mass: 0.33, diameter: 4879, gravity: 3.7, distanceSun: 0, temperature: 167, dayLength: 0, moons: 0, orbitalPeriod: 0),
        Planet(name: "Mercury", image: "Mercury", mass: 0.33, diameter: 4879, gravity: 3.7, distanceSun: 57.9, temperature: 167, dayLength: 4222.6, moons: 0, orbitalPeriod: 88),
        Planet(name: "Venus", image: "Venus", mass: 4.87, diameter: 12104, gravity: 8.9, distanceSun: 108.2, temperature: 464, dayLength: 2802, moons: 0, orbitalPeriod: 224.7),
        Planet(name: "Earth", image: "Earth", mass: 5.97, diameter: 12756, gravity: 9.8, distanceSun: 149.6, temperature: 15, dayLength: 24, moons: 1, orbitalPeriod: 365.2),
        Planet(name: "Mars", image: "Mars", mass: 0.642, diameter: 6792, gravity: 3.7, distanceSun: 228, temperature: -65, dayLength: 24.7, moons: 2, orbitalPeriod: 687),
        Planet(name: "Jupiter", image: "Jupiter", mass: 1898, diameter: 142984, gravity: 23.1, distanceSun: 778.5, temperature: -110, dayLength: 9.9, moons: 92, orbitalPeriod: 4331),
        Planet(name: "Saturn", image: "Saturn", mass: 568, diameter: 120536, gravity: 9, distanceSun: 1432, temperature: -140, dayLength: 10.7, moons: 83, orbitalPeriod: 10747),
        Planet(name: "Uranus", image: "Uranus", mass: 86.8, diameter: 51118, gravity: 9, distanceSun: 2867, temperature: -195, dayLength: 17.2, moons: 27, orbitalPeriod: 30589),
        Planet(name: "Neptune", image: "Neptune", mass: 102, diameter: 49528, gravity: 8.7, distanceSun: 4515, temperature: -200, dayLength: 16.1, moons: 14, orbitalPeriod: 59800),
        Planet(name: "Pluto", image: "Pluto", mass: 0.0130, diameter: 2376, gravity: 0.7, distanceSun: 5906.4, temperature: -225, dayLength: 153, moons: 5, orbitalPeriod: 90560)
    ]
}
