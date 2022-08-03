//
//  CountryListViewController.swift
//  Clug_Weather
//
//  Created by 이민섭 on 2022/08/02.
//

import UIKit

class CountryListViewController: UIViewController,  UITableViewDelegate, UITableViewDataSource  {
    
    
    
    @IBOutlet weak var tableView: UITableView!
    let countrycellIdentifier : String = "countryListCell"
    
    var countries : [Country] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
        
        self.nevigationTitleSet()
        setcountries()
        self.tableView.reloadData()

        
    }
    
    
    func nevigationTitleSet(){
        self.navigationItem.title = "세계 날씨"
    }
    
    func setcountries(){
        let jsonDecoder : JSONDecoder = JSONDecoder()
        guard let dataAsset : NSDataAsset = NSDataAsset( name: "countries") else { return }
        
        do{
            self.countries = try jsonDecoder.decode([Country].self, from: dataAsset.data)
        }catch{
            print(error.localizedDescription)
        }
        print("JSON READ setcountries() completed")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: self.countrycellIdentifier, for: indexPath)
        
       
        let country: Country = self.countries[indexPath.row]
        
        cell.textLabel?.text = country.name
        cell.imageView?.image = country.image
        
        return cell
        
         
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        guard let nextViewController : CityListViewController = segue.destination as? CityListViewController else {
            return
        }
        
        guard let cell: UITableViewCell = sender as? UITableViewCell else {
            return
        }
        
        guard let countryName : String = cell.textLabel?.text else {
            return
        }
        
        guard let countryAssetname : String = getCountryAssetNameFromCountryName(  countryName ) else {
            return
        }
        
        nextViewController.countryName = countryName
        nextViewController.countryAssetName = countryAssetname
        
        
        
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    
    func getCountryAssetNameFromCountryName(_ countryName: String ) -> String?{
        for country in countries {
            if country.name == countryName{
                print(country.assetName)
                return country.assetName
            }
        }
        print("country not found")
        return nil
    }
    

}

