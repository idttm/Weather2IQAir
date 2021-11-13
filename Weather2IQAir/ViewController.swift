//
//  ViewController.swift
//  Weather2IQAir
//
//  Created by Andrew Cheberyako on 07.04.2021.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var windLabel: UILabel!
    @IBOutlet weak var aqiusLabel: UILabel!
    @IBOutlet weak var searchStateTextField: UITextField!
    @IBOutlet weak var searchCityTextField: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var moreInfoButton: UIButton!
    
    
    var networkAirManager = NetworkAirManager()
    var viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        networkAirManager.delgate = self
        viewModel.defoultCity()
        DispatchQueue.main.async {
            self.cityLabel.text = self.viewModel.model.cityName
            print(self.viewModel.model.cityName)
        }
        
//        activityIndicator.isHidden = true
//        activityIndicator.color = .black
//        searchCityTextField.delegate = self
//        searchStateTextField.delegate = self
//        dataCurrentAir.defoultCity()
//        if cityLabel.text == "" {
//            activityIndicator.isHidden = false
//            activityIndicator.startAnimating()
//        }
        
        
        
    }
  
    
    @IBAction func searhPressed(_ sender: Any) {
        
        guard let searchState = searchStateTextField.text else {return}
        guard let searchCity = searchCityTextField.text else {return}
        print(searchCity, searchState)
//        dataCurrentAir.defoultCity()
        activityIndicator.startAnimating()
        activityIndicator.isHidden = false
//        dataCurrentAir.defoultCity(forCity: searchCity, forState: searchState)
//        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
//            self.cityLabel.text = self.dataCurrentAir.model.cityName
//            self.countryLabel.text = self.dataCurrentAir.model.countryName
//            self.temperatureLabel.text = self.dataCurrentAir.model.weatherTemString
//            self.windLabel.text = self.dataCurrentAir.model.windSpeed
//            self.aqiusLabel.text = self.dataCurrentAir.model.pollutionAqius
//            self.activityIndicator.stopAnimating()
//            self.activityIndicator.isHidden = true
//        }
//        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
//            if self.dataCurrentAir.model.error1 != "" { self.presentAlertController(withTitle: "Error", message: self.dataCurrentAir.model.error1, style: .alert)
//            }
//        }
       
        
    }
    
}
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
extension ViewController {
    func presentAlertController(withTitle title: String?, message: String?, style: UIAlertController.Style) {
        let ac = UIAlertController(title: title, message: message, preferredStyle: style)
        let action = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        ac.addAction(action)
        self.present(ac, animated: true, completion: nil)
    }
}
//extension ViewController: NetworkAirManagerDelegate {
//    func updateInterface(_: NetworkAirManager, with currentAir: CurrentAir) {
//        DispatchQueue.main.async {
//            self.cityLabel.text = currentAir.cityName
//            self.countryLabel.text =
//            self.temperatureLabel.text = self.dataCurrentAir.model.weatherTemString
//            self.windLabel.text = self.dataCurrentAir.model.windSpeed
//            self.aqiusLabel.text = self.dataCurrentAir.model.pollutionAqius
//            if self.cityLabel.text != "" {
//                self.activityIndicator.stopAnimating()
//                self.activityIndicator.isHidden = true
//            }
//            self.moreInfoButton.isEnabled = true
//        }
//    }
//
//
//
//
//}

