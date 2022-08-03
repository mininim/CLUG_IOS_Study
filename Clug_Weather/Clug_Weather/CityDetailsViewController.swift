//
//  CityDetailsViewController.swift
//  Clug_Weather
//
//  Created by 이민섭 on 2022/08/03.
//

import UIKit

class CityDetailsViewController: UIViewController {

    
    var city: City?

    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var rainfallProbabilityLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nevigationTitleSet()
        // Do any additional setup after loading the view.
        self.uiReloadData(city: self.city )
    }
    
    func nevigationTitleSet(){
        self.navigationItem.title = self.city?.name
    }
   
    
    func uiReloadData( city : City? ) {
        
        self.weatherImage?.image = city?.stateimage
        self.stateLabel?.text = city?.stateLabel
        self.temperatureLabel?.text = city?.temperatureMessage
        if self.city!.celsius < 10 {
            self.temperatureLabel?.textColor = .systemBlue
        }
        self.rainfallProbabilityLabel?.text = city?.rainfallProbabilityMessage
        if self.city!.rainfallProbability >= 50 {
            self.rainfallProbabilityLabel?.textColor = .systemOrange
        }
    }


}
