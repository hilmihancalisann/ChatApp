//
//  LoginViewModel.swift
//  ChatApp
//
//  Created by Hilmihan Çalışan on 5.01.2023.
//

import Foundation


struct LoginViewModel {
    
    var emailTextField: String?
    var passwordTextField: String?
    var status:Bool {
     
        return emailTextField?.isEmpty == false && passwordTextField?.isEmpty == false
    }
    
    
}
