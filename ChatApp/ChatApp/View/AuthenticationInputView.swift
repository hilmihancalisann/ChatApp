//
//  AuthenticationInputView.swift
//  ChatApp
//
//  Created by Hilmihan Çalışan on 3.01.2023.
//

import UIKit

class AuthenticationInputView: UIView {
    
    init(image: UIImage, textField: UITextField) {
        super.init(frame: .zero)
        
        let imageview = UIImageView()
        imageview.contentMode = .scaleAspectFill
        imageview.clipsToBounds = true
        imageview.image = image
        imageview.tintColor = .white
        imageview.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageview)
        textField.translatesAutoresizingMaskIntoConstraints = false
        addSubview(textField)
       
      /*   let dividerView = UIView()                                email password altına izgi yapmak için yazdıgım kod
        dividerView.backgroundColor = .white
        dividerView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(dividerView) */
        
        NSLayoutConstraint.activate([
            imageview.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            imageview.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageview.widthAnchor.constraint(equalToConstant: 24),
            imageview.heightAnchor.constraint(equalToConstant: 24),
            
            textField.centerYAnchor.constraint(equalTo: imageview.centerYAnchor),
            textField.leadingAnchor.constraint(equalTo: imageview.trailingAnchor, constant: 8),
            trailingAnchor.constraint(equalTo: textField.trailingAnchor, constant: 8),
            
          /*  dividerView.heightAnchor.constraint(equalToConstant: 0.70),
            dividerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            dividerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            dividerView.trailingAnchor.constraint(equalTo: trailingAnchor) */
        
        ])
        
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 0.25
        layer.cornerRadius = 15
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
