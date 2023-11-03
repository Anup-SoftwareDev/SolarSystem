//
//  PlanetViewModelTests.swift
//  SolarSystemTests
//
//  Created by Anup Kuriakose on 3/11/2023.
//

import Quick
import Nimble
@testable import SolarSystem

class PlanetViewModelTests: QuickSpec {
    override class func spec() {
        describe("PlanetViewModel") {
            var viewModel: PlanetViewModel!

            beforeEach {
                viewModel = PlanetViewModel()
            }

            context("when initialized") {
                it("should have correct planet count") {
                    expect(viewModel.planetCount).to(equal(PlanetDataService.planets.count))
                }
            }

            context("fetching planets") {
                it("should return the correct planet for a given index") {
                    let testIndex = 1 // Example index, you can change this.
                    let expectedPlanet = PlanetDataService.planets[testIndex]
                    
                    expect(viewModel.planet(at: testIndex)).to(equal(expectedPlanet))
                }

                it("should not crash for out of range index") {
                    let outOfRangeIndex = viewModel.planetCount + 1
                    
                    // This checks if the closure (code inside {}) throws an error, it's used for potential runtime errors
                    expect {
                        _ = viewModel.planet(at: outOfRangeIndex)
                    }.to(throwAssertion())
                }
            }
        }
    }
}
