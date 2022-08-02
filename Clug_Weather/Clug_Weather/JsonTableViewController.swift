//
//  JsonTableViewController.swift
//  Clug_Weather
//
//  Created by 이민섭 on 2022/08/02.
//

import UIKit

class JsonTableViewController: UIViewController , UITableViewDataSource {
    
        
    @IBOutlet weak var tableView: UITableView!
    let cellIdentifier: String = "jsoncell"
    var friends : [Friend] = []
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath)
       
        let friend: Friend = self.friends[indexPath.row]
        
        cell.textLabel?.text = friend.nameAndAge
        cell.detailTextLabel?.text = friend.fullAddress
        return cell
        
         
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let jsonDecoder : JSONDecoder = JSONDecoder()
        guard let dataAsset : NSDataAsset = NSDataAsset( name: "friends") else { return }
        
        do{
            self.friends = try jsonDecoder.decode([Friend].self, from: dataAsset.data)
        }catch{
            print(error.localizedDescription)
        }
        
        self.tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
