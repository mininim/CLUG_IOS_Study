//
//  WeatherData.swift
//  Clug_Weather
//
//  Created by 이민섭 on 2022/08/02.
//

import Foundation
import UIKit

struct Country: Codable{

    let name: String
    let assetName: String
    
    var image : UIImage {
        
        return UIImage.init(named: "flag_\(assetName)") ?? UIImage()
    }
    
    enum CodingKeys : String , CodingKey{
        case name = "korean_name"
        case assetName = "asset_name"
    }
    
}

struct City: Codable {
    
    let name: String
    let state: Int
    var stateimage: UIImage {
        switch state{
            
        case 10 :
            return UIImage.init(named: "sunny") ?? UIImage()
        case 11 :
            return UIImage.init(named: "cloudy") ?? UIImage()
        case 12 :
            return UIImage.init(named: "rainy") ?? UIImage()
        case 13 :
            return UIImage.init(named: "snowy") ?? UIImage()
            
        default:
            return UIImage()
        }
        
    }
    var stateLabel: String {
        switch state{
            
        case 10 :
            return "맑음"
        case 11 :
            return "흐림"
        case 12 :
            return "비"
        case 13 :
            return "눈"
            
        default:
            return ""
        }
        
    }
    
    
    let celsius : Double
    
    
    var temperatureMessage: String {
        let celsius = String(format: "%.1f", self.celsius)
        let fahrenheit = String(format: "%.1f", (self.celsius * 1.8) + 32)
        return "섭씨 " + celsius + "도 / 화씨 " + fahrenheit + "도"
    }
    
    let rainfallProbability: Int
    
    var rainfallProbabilityMessage: String {
        return "강수확률 \(rainfallProbability)%"
    }
    
    
    enum CodingKeys : String , CodingKey{
        case name = "city_name"
        case state = "state"
        case celsius = "celsius"
        case rainfallProbability = "rainfall_probability"
        
    }
    
}



/*
 
 "city_name":"베를린",
 "state":12,
 "celsius":10.8,
 "rainfall_probability":60
 
 {"korean_name":"한국","asset_name":"kr"},
 */
