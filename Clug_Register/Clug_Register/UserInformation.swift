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
    
    
    var id: String?
    var password: String?
    
    var phoneNumber: String?
    var birthdaydate : String?
    
    var image: UIImage?
    
    func printIDPASSWORD(){
        print("\(id)  ----  \(password) ")
    }
    
    
}
