//
//  ViewController.swift
//  Clug_Register
//
//  Created by 이민섭 on 2022/07/27.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var idField:UITextField!
    @IBOutlet weak var passwordField:UITextField!
    
    @IBOutlet weak var signInButton: UIButton!{
        didSet{
            signInButton.isEnabled = false
        }
    }
    
    
    @IBAction func signInButtonTapped(_ sender: Any) {
        
        if UserInformation.shared.signInCheck(id: idField.text!, password: passwordField.text! ){
            //스토리보드 객체 생성, name은 스토리보드의 기본인 Main
            let storyboard = UIStoryboard(name: "Main", bundle: nil)

            //컨트롤러 객체 생성, Storyboard ID에 이름 설정(이동할 VC에 설정한 Storyboard ID)
            let secondVC: SignInSuccessViewController = storyboard.instantiateViewController(withIdentifier: "SignInSuccessViewController") as! SignInSuccessViewController

            //기본값이 fullScreen이므로 해당 라인은 생략 가능
            secondVC.modalPresentationStyle = .fullScreen
            self.present(secondVC, animated: true, completion: nil)
            
            
            
        }else {
            print("아이디 비번 확인하십쇼오오오오오오오")
        }
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.idField.addTarget(self, action: #selector(self.textFieldsDidChange(_:)), for: .editingChanged)
        self.passwordField.addTarget(self, action: #selector(self.textFieldsDidChange(_:)), for: .editingChanged)
        
    }
    
    @objc private func textFieldsDidChange(_ sender: Any?) {
//        print("textFieldsDidBeginEditing 실행")
        buttonEnableIfValidInput()
        
    }
    
    
    //유효성 검사를 통한 버튼 활성화
    func buttonEnableIfValidInput(){
        if self.isvalidatetextfieldinput()  == true {
            signInButton.isEnabled = true
            return
        }else {
            signInButton.isEnabled = false
            return
        }
    }
    
    //유효성 검사
    func isvalidatetextfieldinput()-> Bool{
        
        if idField.text?.isEmpty == false , passwordField.text?.isEmpty == false {
            return true
        }else{
            return false
        }
        
    }
    
    
}

