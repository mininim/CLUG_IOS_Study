//
//  UserInformation.swift
//  Clug_Register
//
//  Created by 이민섭 on 2022/07/27.
//

import Foundation
import UIKit


class UserInformation{
    
    
    static let shared: UserInformation = UserInformation()
    
    var image: UIImage?
    var id: String?
    var password: String?
    var introducing: String?
    
    var phoneNumber: String?
    var birthdaydate : String?

    func printIDPASSWORD(){
        print("\(id)  ----  \(password) ")
    }
    
    
    func signInCheck(id: String, password: String ) -> Bool {
        
        if self.id == id , self.password == password {
            return true
        }else {
            return false
        }
        
    }
    
    
    func updateIdAndPassword(id: String, password: String , introducing: String ){
    
        self.id = id
        self.password = password
        self.introducing = introducing
    
    }
    
    func updateDetails( phoneNumber: String, birthdaydate: String  ){
        self.phoneNumber = phoneNumber
        self.birthdaydate = birthdaydate
    }
    
    func removeData(){
        image = nil
        id = nil
        password = nil
        introducing = nil
        phoneNumber = nil
        birthdaydate = nil
        
    }
    
    
    
}
