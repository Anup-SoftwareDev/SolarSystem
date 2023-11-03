//
//  PlanetDetailViewModelTests.swift
//  SolarSystemTests
//
//  Created by Anup Kuriakose on 3/11/2023.
//

import Quick
import Nimble
@testable import SolarSystem

class PlanetDetailViewModelSpec: QuickSpec {
    override class func spec() {
        describe("PlanetDetailViewModel") {
            var planet: Planet!
            var viewModel: PlanetDetailViewModel!

            beforeEach {
                planet = Planet(name: "Mercury", image: "Mercury", mass: 0.33, diameter: 4879, gravity: 3.7, distanceSun: 57.9, temperature: 167, dayLength: 4222.6, moons: 0, orbitalPeriod: 88 /* Initialize with some sample data */ )
                viewModel = PlanetDetailViewModel(planet: planet)
            }

            it("correctly initializes with a planet") {
                expect(viewModel.planet).to(equal(planet))
            }

            it("returns the correct title") {
                expect(viewModel.title).to(equal("\(planet.name) Info"))
            }

            it("returns the correct imageName") {
                expect(viewModel.imageName).to(equal(planet.name))
            }

            context("when fetching planet data") {
                it("returns the correct data for mass") {
                    expect(viewModel.planetData[0]).to(equal(["Mass", String(planet.mass), "10^24 kg"]))
                }
                
                // Similar tests for diameter, gravity, etc.
            }
        }
    }
}

