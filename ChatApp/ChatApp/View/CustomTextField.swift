//
//  CustomTextField.swift
//  ChatApp
//
//  Created by Hilmihan Çalışan on 3.01.2023.
//

import UIKit


class CustomTextField: UITextField {
    
    init(plecholder: String) {
        super.init(frame: .zero)
        
        attributedPlaceholder = NSMutableAttributedString(string: plecholder, attributes: [.foregroundColor: UIColor.white])
        borderStyle = .none
        textColor = .black
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
