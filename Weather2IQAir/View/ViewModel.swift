//
//  ViewModel.swift
//  Weather2IQAir
//
//  Created by Andrew Cheberyako on 08.04.2021.
//

import UIKit

struct Model {
    var cityName = " "
    var countryName = " "
    var state = " "
    var weatherTemString = " "
    var windSpeed = " "
    var pollutionAqius = " "
    var pressure = " "
    var humidity = " "
    var windDirection = " "
    var pollutionAqicn = " "
    var error1 = " "
}

class ViewModel {
    
    var networkAirManager =  NetworkAirManager()
   
   
    var model = Model()
    
    func defoultCity(forCity: String = "Sacramento" , forState: String = "California") {
        networkAirManager.fetchCurrentAir(forCity: forCity, forState: forState) { currentAir in
            self.model.cityName = " Город \(currentAir.cityName)"
            self.model.countryName = "Страна \(currentAir.countryName)"
            self.model.weatherTemString = "Температура \(currentAir.weatherTemString) °C"
            self.model.windSpeed = "Скорость ветра \(currentAir.weatherWindString) м/с"
            self.model.pollutionAqius = "Загрязнение AQIus \(currentAir.pollutionAqiusString)"
            self.model.state = "Штат \(currentAir.state)"
            self.model.pressure = "Давление \(currentAir.prString)"
            self.model.humidity = "Влажность \(currentAir.huString)"
            self.model.windDirection = "Направление ветра \(currentAir.wdString)"
            self.model.pollutionAqicn = "Загрязение AQIcn\(currentAir.aqicnString)"
            
        } onFile:  {(error) in
            self.model.error1 = "\(error.localizedDescription)"
            
        }
    }
    
}

