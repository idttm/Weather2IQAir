//
//  NetworkWeatherManager.swift
//  Weather2IQAir
//
//  Created by Andrew Cheberyako on 07.04.2021.
//

import Foundation

protocol NetworkAirManagerDelegate {
    func updateInterface(_: NetworkAirManager, with currentAir: CurrentAir)
}


struct NetworkAirManager {
    
    var delgate: NetworkAirManagerDelegate?
    
    func fetchCurrentAir(forCity city: String = "Sacramento", forState state: String = "California", onFile: @escaping (Error) -> Void) {
        let urlString = "https://api.airvisual.com/v2/city?city=\(city)&state=\(state)&country=USA&key=\(apiKey)"
        guard let url = URL(string: urlString) else {return}
        let session = URLSession(configuration: .default)
        let task =  session.dataTask(with: url) { (data, response, error) in
            if let data = data {
                if let currentAir =  self.parseJSON(withData: data, onFail: onFile) {
                    self.delgate?.updateInterface(self, with: currentAir)
                }
            }
        }
        task.resume()
    }
    
    func parseJSON(withData data: Data, onFail: @escaping(Error) -> Void) -> CurrentAir?  {
        
        let decoder = JSONDecoder()
        do {
            let currentAirData = try decoder.decode(Welcome.self, from: data)
            guard let currentAir = CurrentAir(cureentAirData: currentAirData) else {return nil}
            return currentAir
        } catch let error  {
            print(error.localizedDescription)
            onFail(error)
        }
        return nil
        
    }
    
}

