//
//  RegisterDetailsViewController.swift
//  Clug_Register
//
//  Created by 이민섭 on 2022/07/27.
//

import UIKit

class RegisterDetailsViewController: UIViewController {
    
    
    @IBOutlet weak var phoneNumber:UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var registerButton: UIButton!{
        didSet{
            registerButton.isEnabled = false
        }
    }
    
    
    let dateFormatter: DateFormatter = {
        let formatter: DateFormatter = DateFormatter()
        formatter.dateFormat = "MMMM d, YYYY"
        return formatter
    }()
    
    @IBAction func didDatePickerValueChanged(_ sender: UIDatePicker){
        //pickerview.addtarget으로 추가
        print("picker view 바뀜")
        
        let date: Date = self.datePicker.date
        let dateString: String = self.dateFormatter.string(from: date)
        
        self.dateLabel.text = dateString
       
    }
    
    
    
    @IBAction func didphoneNumberTextFieldChanged(_ sender: UITextField){
        //addtarget으로 추가
        print("전화번호 text field 바뀜")
        registerbuttonEnableIfValidInput()
    }
    
    
    
    //-- 버튼 처리
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        
        //dismisss는 modal을 없애는 메소드
        // 초기화면에 modal로 navigation view controller가 스택에 registerview , registerdetailview를 담고 있는 상황
        //dismiss하면 modal로 연결되어 있는 navigation view controller를 없앰
        UserInformation.shared.removeData()
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
    @IBAction func previewButtonTapped(_ sender: Any) {
        //navigationcontroller에서 최상단 view를 pop 시킴 즉 이 뷰를 없앰
        //navigation tapbar에서 뒤로가기와 같은 원리
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func registerButtonTapped(_ sender: Any) {
        UserInformation.shared.updateDetails(phoneNumber: phoneNumber.text!, birthdaydate: dateLabel.text! )
        
        
        let preVC = self.presentingViewController
        guard let vc = preVC as? ViewController else {
            return
        }
        
        vc.idField.text = UserInformation.shared.id
        vc.passwordField.text = UserInformation.shared.password
        vc.signInButton.isEnabled = true
        
        
        self.dismiss(animated: true, completion: nil)
        
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.datePicker.addTarget(self, action: #selector(didDatePickerValueChanged(_ :) ), for: UIControl.Event.valueChanged )
        self.phoneNumber.addTarget(self, action: #selector(self.didphoneNumberTextFieldChanged(_:)), for: .editingChanged)
        // Do any additional setup after loading the view.
    }
    
    
    //유효성 검사를 통한 버튼 활성화
    func registerbuttonEnableIfValidInput(){
        if self.isvalidatetextfieldinput()  == true {
            registerButton.isEnabled = true
            return
        }else {
            registerButton.isEnabled = false
            return
        }
    }
    
    //유효성 검사
    func isvalidatetextfieldinput()-> Bool{
        
        if phoneNumber.text?.isEmpty == false {
            return true
        }else{
            return false
        }
        
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
