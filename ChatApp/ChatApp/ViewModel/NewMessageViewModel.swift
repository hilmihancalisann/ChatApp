//
//  MessageViewModel.swift
//  ChatApp
//
//  Created by Hilmihan Çalışan on 14.03.2023.
//

import UIKit
struct NewMessageViewModel {
    
    private let message: Message
    init(message: Message) {
        self.message = message
    }
    
    var messageBackgroundColor: UIColor{
        return message.currentUser ? .systemPink.withAlphaComponent(0.7): .systemBlue.withAlphaComponent(0.7)
    }
    var currentUserActive: Bool{
        return message.currentUser
    }
    var profileImageView: URL?{
        return URL(string: message.user?.profileImageUrl ?? "")
    }
}
