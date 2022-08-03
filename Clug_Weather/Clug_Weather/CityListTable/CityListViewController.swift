//
//  CityListViewController.swift
//  Clug_Weather
//
//  Created by 이민섭 on 2022/08/03.
//

import UIKit

class CityListViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {
    
    var countryName: String?
    var countryAssetName: String?
    var cities : [City] = []
    var cityCellIdentifier = "cityCell"
    
    @IBOutlet weak var CitytableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CitytableView.delegate = self
        CitytableView.dataSource = self
        
        nevigationTitleSet()
        setcities()
        
        self.CitytableView.reloadData()
        // Do any additional setup after loading the view.
        print("CityListViewController - viewDidLoad")
    }
    
    func nevigationTitleSet(){
        self.navigationItem.title = countryName!
    }
    
    func setcities(){
        
        guard let assetName : String = countryAssetName else { return }
        
        let jsonDecoder : JSONDecoder = JSONDecoder()
        guard let dataAsset : NSDataAsset = NSDataAsset( name: assetName ) else { return }
        
        do{
            self.cities = try jsonDecoder.decode([City].self, from: dataAsset.data)
        }catch{
            print(error.localizedDescription)
        }
        
        print("JSON READ setcities() completed")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cityCellIdentifier, for: indexPath) as! CityTableViewCell
        
        let city: City = self.cities[indexPath.row]
        
        cell.city = city
        cell.weatherImage?.image = city.stateimage
        cell.citynameLabel?.text = city.name
        cell.temperatureLabel?.text = city.temperatureMessage
        if city.celsius < 10 {
            cell.temperatureLabel?.textColor = .systemBlue
        }
        
        cell.rainfallProbabilityLabel?.text = city.rainfallProbabilityMessage
        if city.rainfallProbability >= 50 {
            cell.rainfallProbabilityLabel?.textColor = .systemOrange
        }
        
        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let nextViewController : CityDetailsViewController = segue.destination as? CityDetailsViewController else {
            return
        }
        
        guard let cell: CityTableViewCell = sender as? CityTableViewCell else {
            return
        }
        

        nextViewController.city = cell.city
        
//        iboutlet을 메소드안에 넣어서 불러도 초기화불가
//        nextViewController.uiInitialize(city: (cell.city)! )
        
        
    }
    
    func getCityFromCityNam(_ cityName: String ) -> City?{
        for city in cities {
            if city.name == cityName { return city }
        }
        print("city not found")
        return nil
    }

    

}
