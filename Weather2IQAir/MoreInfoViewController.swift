//
//  MoreInfoViewController.swift
//  Weather2IQAir
//
//  Created by Andrew Cheberyako on 09.04.2021.
//

import UIKit

class MoreInfoViewController: UIViewController {

    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var stateNameLabel: UILabel!
    @IBOutlet weak var countryNameLabel: UILabel!
    @IBOutlet weak var temeratureLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var windSpeedLabel: UILabel!
    @IBOutlet weak var windDirection: UILabel!
    @IBOutlet weak var aqinsLabel: UILabel!
    @IBOutlet weak var aqicnLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var dataCurrentAir = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataCurrentAir.defoultCity()
        if cityNameLabel.text == "" {
            activityIndicator.isHidden = false
            activityIndicator.startAnimating()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.cityNameLabel.text = self.dataCurrentAir.model.cityName
            self.stateNameLabel.text = self.dataCurrentAir.model.state
            self.countryNameLabel.text = self.dataCurrentAir.model.countryName
            self.temeratureLabel.text = self.dataCurrentAir.model.weatherTemString
            self.pressureLabel.text = self.dataCurrentAir.model.pressure
            self.humidityLabel.text = self.dataCurrentAir.model.humidity
            self.windSpeedLabel.text = self.dataCurrentAir.model.windSpeed
            self.windDirection.text = self.dataCurrentAir.model.windDirection
            self.aqinsLabel.text = self.dataCurrentAir.model.pollutionAqius
            self.aqicnLabel.text = self.dataCurrentAir.model.pollutionAqicn
            if self.cityNameLabel.text != "" {
                self.activityIndicator.stopAnimating()
                self.activityIndicator.isHidden = true
            }
        }
        
       
        

        
    }
    



}
