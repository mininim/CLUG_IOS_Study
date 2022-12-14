//
//  ViewController.swift
//  Clug_Weather
//
//  Created by 이민섭 on 2022/08/01.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var tableView: UITableView!
    
    let cellIdentifier : String = "cell"
    let customCellIdentifier : String = "customCell"
    
    let korean : [String] = ["가", "나", "다", "라", "마", "바", "사", "아","자","아","자","화","이", "자"]
    
    let english : [String] = ["A", "B", "C", "D", "E", "F", "E", "F", "U", "B" , "U", "T", "Y", "O" ,"U","R","D","O" ,"G"]
    
    var dates : [Date] = []
    
    let dateFormatter: DateFormatter = {
        let formatter: DateFormatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }()
    
    let timeFormatter: DateFormatter = {
        let formatter: DateFormatter = DateFormatter()
        formatter.timeStyle = .medium
        return formatter
    }()
    
    @IBAction func touchUpAddButton(_ sender : UIButton){
        
        dates.append(Date())
        self.tableView.reloadSections(IndexSet(2...2), with: UITableView.RowAnimation.automatic )        
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section{
        
        case 0:
            return korean.count
        
        case 1:
            return english.count
        
        case 2:
            return dates.count
            
        default:
            return 0
            
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                
            
        if indexPath.section < 2 {
                
            let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath)
                
            let text :String = indexPath.section == 0 ? korean[indexPath.row] : english[indexPath.row]
                
            cell.textLabel?.text = text
            
            if indexPath.row == 1 {
                cell.backgroundColor = UIColor.red
            }else {
                cell.backgroundColor = UIColor.systemBackground
            }
            
            return cell
            
        }else {
        
            let cell: CustomTableViewCell = tableView.dequeueReusableCell(withIdentifier: self.customCellIdentifier, for: indexPath) as! CustomTableViewCell
            
            cell.leftLabel?.text = self.dateFormatter.string(from: self.dates[indexPath.row])
            
            cell.rightLabel?.text = self.timeFormatter.string(from: self.dates[indexPath.row])
            
            return cell
            
        }
        
        
    }
    
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section < 2 {
            return section == 0 ? "한글" : "영어"
        }
        return nil
        
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         
        guard let nextViewController : SecondViewController = segue.destination as? SecondViewController else {
            return
        }
        
        guard let cell: UITableViewCell = sender as? UITableViewCell else {
            return
        }
        
        nextViewController.textToSet = cell.textLabel?.text
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        
        
    }
    

    
}

