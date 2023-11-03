//
//  PlanetDataTests.swift
//  SolarSystemTests
//
//  Created by Anup Kuriakose on 3/11/2023.
//

import Quick
import Nimble
@testable import SolarSystem

class PlanetDataTests: QuickSpec {
    override class func spec() {
        describe("Planet") {
            context("when initialized") {
                let samplePlanet = Planet(
                    name: "Earth",
                    image: "earth_image",
                    mass: 5.972,
                    diameter: 12742,
                    gravity: 9.81,
                    distanceSun: 149.6,
                    temperature: 15,
                    dayLength: 24.0,
                    moons: 1,
                    orbitalPeriod: 365.24
                )
                
                it("sets the properties correctly") {
                    expect(samplePlanet.name).to(equal("Earth"))
                    expect(samplePlanet.image).to(equal("earth_image"))
                    expect(samplePlanet.mass).to(equal(5.972))
                    // Continue for other properties...
                }
            }

            context("when comparing for equality") {
                let planet1 = Planet(
                    name: "Earth",
                    image: "earth_image",
                    mass: 5.972,
                    diameter: 12742,
                    gravity: 9.81,
                    distanceSun: 149.6,
                    temperature: 15,
                    dayLength: 24.0,
                    moons: 1,
                    orbitalPeriod: 365.24
                )
                
                let planet2 = Planet(
                    name: "Earth",
                    image: "earth_image",
                    mass: 5.972,
                    diameter: 12742,
                    gravity: 9.81,
                    distanceSun: 149.6,
                    temperature: 15,
                    dayLength: 24.0,
                    moons: 1,
                    orbitalPeriod: 365.24
                )
                
                let planet3 = Planet(
                    name: "Mars",
                    image: "mars_image",
                    mass: 0.641,
                    diameter: 6779,
                    gravity: 3.71,
                    distanceSun: 227.9,
                    temperature: -28,
                    dayLength: 24.7,
                    moons: 2,
                    orbitalPeriod: 687.0
                )

                it("considers two identical planets as equal") {
                    expect(planet1).to(equal(planet2))
                }

                it("considers two different planets as not equal") {
                    expect(planet1).toNot(equal(planet3))
                }
            }
        }
    }
}
