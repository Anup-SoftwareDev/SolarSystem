//
//  PlanetData.swift
//  SolarSystem
//
//  Created by Anup Kuriakose on 2/11/2023.
//
import Foundation

struct Planet: Equatable {
    var name: String
    var image: String
    var mass: Double
    var diameter: Int
    var gravity: Double
    var distanceSun: Double
    var temperature: Int
    var dayLength: Double
    var moons: Int
    var orbitalPeriod: Double
}
