//
//  PlanetViewModel.swift
//  SolarSystem
//
//  Created by Anup Kuriakose on 2/11/2023.
//

import Foundation

class PlanetViewModel {
    var planets: [Planet] = PlanetDataService.planets
    
    func planet(at index: Int) -> Planet {
        return planets[index]
    }

    var planetCount: Int {
        return planets.count
    }
    
    // Any other methods that transform or prepare data for the view would go here.
}

