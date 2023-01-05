//
//  Color+Ext.swift
//  ChatApp
//
//  Created by Hilmihan Çalışan on 2.01.2023.
//

import UIKit

extension UIViewController {
    
    func configureGradientLayer() {
        
        let gradient = CAGradientLayer()
        gradient.locations = [0,1]
        gradient.colors = [UIColor.systemBlue.cgColor, UIColor.systemGreen.cgColor]
        gradient.frame = view.bounds
        view.layer.addSublayer(gradient
        )
    }
}
