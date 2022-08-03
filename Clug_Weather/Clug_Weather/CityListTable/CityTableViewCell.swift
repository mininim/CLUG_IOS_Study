//
//  CityTableViewCell.swift
//  Clug_Weather
//
//  Created by 이민섭 on 2022/08/03.
//

import UIKit

class CityTableViewCell: UITableViewCell {
    
    var city : City?
    
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var citynameLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var rainfallProbabilityLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
 
}
