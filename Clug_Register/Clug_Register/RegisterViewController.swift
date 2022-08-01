//
//  RegisterViewController.swift
//  Clug_Register
//
//  Created by 이민섭 on 2022/07/27.
//

import UIKit

class RegisterViewController: UIViewController, UIImagePickerControllerDelegate , UINavigationControllerDelegate , UITextViewDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var idField:UITextField!
    @IBOutlet weak var passwordField:UITextField!
    @IBOutlet weak var passwordField2:UITextField!
    @IBOutlet weak var introducingField:UITextView!
    
    @IBOutlet weak var nextButton: UIButton! {
        didSet{
            nextButton.isEnabled = false
        }
    }
    
    lazy var imagePicker: UIImagePickerController = {
        let picker: UIImagePickerController = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        return picker
    }()
    
    
    @IBAction func touchUpNext(_ sender: UIButton) {
        
        UserInformation.shared.updateIdAndPassword(id: idField.text!, password: passwordField.text!, introducing: introducingField.text )
        
    }
    
    @IBAction func touchCancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func tapImageView(_ sender: UITapGestureRecognizer) {
        print("tap")
        self.present(self.imagePicker, animated: true, completion: nil)
    }
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        print("이미지뷰.Image \(imageView.image)  \(imageView.image != nil) ")
        
        
        //이렇게 말고도 @iabaction으로 editing change 생성 가능
        self.idField.addTarget(self, action: #selector(self.textFieldsDidChange(_:)), for: .editingChanged)
        self.passwordField.addTarget(self, action: #selector(self.textFieldsDidChange(_:)), for: .editingChanged)
        self.passwordField2.addTarget(self, action: #selector(self.textFieldsDidChange(_:)), for: .editingChanged)
        
        //자기소개 textview 는 delegate을 통해 변할때 마다 실행되는 메소드 구현
        introducingField.delegate = self
        
    }
    
    //text field들이 변할때 호출되는 함수
    @objc private func textFieldsDidChange(_ sender: Any?) {
//        print("textFieldsDidBeginEditing 실행")
        buttonEnableIfValidInput()
        
    }
    
    //textview delegate 함수
    func textViewDidChange(_ textView: UITextView) {
        print("자기소개textviewDidBeginEditing 실행")
        buttonEnableIfValidInput()
    }
    
    //유효성 검사를 통한 버튼 활성화
    func buttonEnableIfValidInput(){
        if self.isvalidatetextfieldinput()  == true {
            nextButton.isEnabled = true
            return
        }else {
            nextButton.isEnabled = false
            return
        }
    }
    
    //유효성 검사
    func isvalidatetextfieldinput()-> Bool{
        
        if imageView.image != nil ,idField.text?.isEmpty == false , passwordField.text?.isEmpty == false, passwordField2.text?.isEmpty == false, introducingField.text.isEmpty == false, passwordField.text!.compare(passwordField2.text!) == ComparisonResult.orderedSame {
            return true
        }else{
            return false
        }
        
    }
    

    
    //UIImagePickerControllerDelegate , UINavigationControllerDelegate 함수 추가
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        //info는 딕셔너리 타입으로 가지고 있는 거제
        if let originalImage: UIImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.imageView.image = originalImage
            UserInformation.shared.image = originalImage
        }
        
        //추가하고 나서 pickerview를 없애고난 completion으로 buttonEnableIfValidInput 실행 -> 이미지를 마지막에 넣어도 validate 검사 진행 
        self.dismiss(animated: true, completion: self.buttonEnableIfValidInput )
        
        
        
    }
    
}
