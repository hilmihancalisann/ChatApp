//
//  RegisterVM.swift
//  ChatApp
//
//  Created by Hilmihan Çalışan on 5.01.2023.
//

import Foundation


struct RegisterVM {
    
    var email: String?
    var name: String?
    var usernama: String?
    var password: String?
    
    var status: Bool{
        
        return email?.isEmpty == false && password?.isEmpty == false && name?.isEmpty == false && usernama?.isEmpty == false
    }
}
