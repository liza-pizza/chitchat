//
//  Constants.swift
//  chitchat
//
//  Created by Liza Bipin on 24/08/21.
//

import Foundation
 
struct K {
    static let appName = "chitchat"
    static let registerSegue = "RegisterToChat"
    static let loginSegue = "LoginToChat"
    static let cellIdentifier = "ReusableCell"
    static let cellNibName = "MessageCell"
    
    struct FStore {
        static let collectionName = "messages"
        static let senderField = "sender"
        static let bodyField = "body"
        static let dateField = "date"
    }
    
    struct AppColors{
        static let green = "BrandGreen"
        static let lightGreen = "BrandLightGreen"
        static let peach = "BrandPeach"
        static let lightPeach = "BrandLightPeach"
    }
}
