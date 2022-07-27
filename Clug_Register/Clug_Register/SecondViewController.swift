//
//  SecondViewController.swift
//  Clug_Register
//
//  Created by 이민섭 on 2022/07/27.
//

import UIKit

class SecondViewController: UIViewController {

    
    @IBOutlet weak var nameLabel :UILabel!
    @IBOutlet weak var ageLabel :UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("222ViewController의 view가 메모리에 로드됨")
        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
//        self.nameLabel.text = UserInformation.shared.name
//        self.ageLabel.text = UserInformation.shared.age
//        print("222ViewController의 view가 화면에 보여질 예정")
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("222ViewController의 view가 화면에 보여짐")
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("222ViewController의 view가 화면에서 사라질 예정 ")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("222ViewController의 view가 화면에서 사라짐")
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("222ViewController의 view가 subview를 레이아웃하려함")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("222ViewController의 view가 subview를 레이아웃함")
    }
    
    
    
    @IBAction func popToPrev(){
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func disMissModal(){
        self.dismiss(animated: true, completion: nil)
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
