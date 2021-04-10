//
//  CurrentAir.swift
//  Weather2IQAir
//
//  Created by Andrew Cheberyako on 07.04.2021.
//

import Foundation

struct CurrentAir {
    let cityName: String
    let countryName: String
    let weatherTem: Int
    let state: String
    let aqicn: Int
    var aqicnString: String {
        return "\(aqicn)"
    }
    let pr: Int
    var prString: String {
       return "\(pr)"
    }
    let hu: Int
    var huString: String {
        return "\(hu)"
    }
    let wd: Int
    var wdString: String {
        return "\(wd)"
    }
    var weatherTemString: String {
        return "\(weatherTem)"
    }
    let weatherWind: Double
    var weatherWindString: String {
        return "\(weatherWind)"
    }
    let pollutionAqius: Int
    var pollutionAqiusString: String {
        return "\(pollutionAqius)"
    }
    let status: String
    
    init?(cureentAirData: Welcome) {
        cityName = cureentAirData.data.city
        countryName = cureentAirData.data.country
        weatherTem = cureentAirData.data.current.weather.tp
        weatherWind = cureentAirData.data.current.weather.ws
        pollutionAqius = cureentAirData.data.current.pollution.aqius
        status = cureentAirData.status
        state = cureentAirData.data.state
        aqicn = cureentAirData.data.current.pollution.aqicn
        pr = cureentAirData.data.current.weather.pr
        hu = cureentAirData.data.current.weather.hu
        wd = cureentAirData.data.current.weather.wd
    }
}
