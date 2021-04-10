//
//  CurrentAirData.swift
//  Weather2IQAir
//
//  Created by Andrew Cheberyako on 07.04.2021.
//

import Foundation


struct Welcome: Codable {
    let status: String
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let city: String
    let state: String
    let country: String
    let location: Location
    let current: Current
}

// MARK: - Current
struct Current: Codable {
    let weather: Weather
    let pollution: Pollution
}

// MARK: - Pollution
struct Pollution: Codable {
    let ts: String
    let aqius: Int
    let mainus: String
    let aqicn: Int
    let maincn: String
}

// MARK: - Weather
struct Weather: Codable {
    let ts: String
    let tp: Int
    let pr: Int
    let hu: Int
    let ws: Double
    let wd: Int
    let ic: String
}

// MARK: - Location
struct Location: Codable {
    let type: String
    let coordinates: [Double]
}

