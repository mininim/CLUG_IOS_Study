//
//  RegisterViewController.swift
//  Clug_Register
//
//  Created by 이민섭 on 2022/07/27.
//

import UIKit

class RegisterViewController: UIViewController, UIImagePickerControllerDelegate , UINavigationControllerDelegate {

    @IBOutlet weak var idField:UITextField!
    @IBOutlet weak var passwordField:UITextField!
    @IBOutlet weak var passwordField2:UITextField!
    
    
    
    lazy var imagePicker: UIImagePickerController = {
        let picker: UIImagePickerController = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        return picker
    }()
    
    
    @IBAction func touchUpNext(_ sender: UIButton) {
        
        guard let id = idField.text , let password = passwordField.text, password == passwordField2.text else { print("오류"); return }
        
        UserInformation.shared.id = id
        UserInformation.shared.password = password
        
        
        UserInformation.shared.printIDPASSWORD()
        
    }
    
    @IBAction func touchCancel(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
        
        
    }
    
    
    @IBAction func tapImageView(_ sender: UITapGestureRecognizer) {
        print("tap")
        self.present(self.imagePicker, animated: true, completion: nil)
    }
    
    
    @IBOutlet weak var imageView: UIImageView!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    //info는 딕셔너리 타입으로 가지고 있는 거제
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let originalImage: UIImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.imageView.image = originalImage
            UserInformation.shared.image = originalImage
        }
        
        
        
        self.dismiss(animated: true, completion: nil)
        
        
        
    }


}
