//
//  PlanetDetailViewModel.swift
//  SolarSystem
//
//  Created by Anup Kuriakose on 2/11/2023.
//

import Foundation

class PlanetDetailViewModel {
    var planet: Planet

    init(planet: Planet) {
        self.planet = planet
    }

    var title: String {
        return "\(planet.name) Info"
    }

    var imageName: String {
        return planet.name
    }

    var planetData: [[String]] {
        return [
            ["Mass", String(planet.mass), "10^24 kg"],
            ["Diameter", String(planet.diameter), "km"],
            ["Gravity", String(planet.gravity), "m/s^2"],
            ["Distance from Sun", String(planet.distanceSun), "10^6 km"],
            ["Mean Temp", String(planet.temperature), "C"],
            ["Day Length",String(planet.dayLength), "hours"],
            ["Orbital Period",String(planet.orbitalPeriod), "days"],
            ["Moons",String(planet.moons), "moon/s"]
        ]
    }
}
