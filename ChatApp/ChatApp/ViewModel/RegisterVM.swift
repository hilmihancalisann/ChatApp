//
//  RegisterVM.swift
//  ChatApp
//
//  Created by Hilmihan Çalışan on 5.01.2023.
//

import Foundation

struct RegisterViewModel {
    var email: String?
    var name: String?
    var userName: String?
    var password: String?
    
    var status: Bool{
        return email?.isEmpty == false && password?.isEmpty == false && userName?.isEmpty == false && name?.isEmpty == false
    }
}
