//
//  ViewModel.swift
//  Weather2IQAir
//
//  Created by Andrew Cheberyako on 08.04.2021.
//

import UIKit

struct Model {
    var cityName = "1"
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
    
    func defoultCity(forCity: String = "Sacramento", forState: String = "California") {
        
        networkAirManager.delgate = self
        
        networkAirManager.fetchCurrentAir(forCity: forCity, forState: forState) { (error) in
            error.localizedDescription
        }
        print(model.cityName)
       
        
           
        }
}
extension ViewModel: NetworkAirManagerDelegate {
    func updateInterface(_: NetworkAirManager, with currentAir: CurrentAir) {
        model.cityName = "Город \(currentAir.cityName)"
        model.countryName = "Страна \(currentAir.countryName)"
        model.weatherTemString = "Температура \(currentAir.weatherTemString) °C"
        model.windSpeed = "Скорость ветра \(currentAir.weatherWindString) м/с"
        model.pollutionAqius = "Загрязнение AQIus \(currentAir.pollutionAqiusString)"
        model.state = "Штат \(currentAir.state)"
        model.pressure = "Давление \(currentAir.prString)"
        model.humidity = "Влажность \(currentAir.huString)"
        model.windDirection = "Направление ветра \(currentAir.wdString)"
        model.pollutionAqicn = "Загрязение AQIcn \(currentAir.aqicnString)"
        print(model.cityName)
    }
    
    
}
/*
self.model.cityName = "Город \(currentAir.cityName)"
self.model.countryName = "Страна \(currentAir.countryName)"
self.model.weatherTemString = "Температура \(currentAir.weatherTemString) °C"
self.model.windSpeed = "Скорость ветра \(currentAir.weatherWindString) м/с"
self.model.pollutionAqius = "Загрязнение AQIus \(currentAir.pollutionAqiusString)"
self.model.state = "Штат \(currentAir.state)"
self.model.pressure = "Давление \(currentAir.prString)"
self.model.humidity = "Влажность \(currentAir.huString)"
self.model.windDirection = "Направление ветра \(currentAir.wdString)"
self.model.pollutionAqicn = "Загрязение AQIcn \(currentAir.aqicnString)"
*/
