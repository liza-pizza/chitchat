//
//  UIAlertControllerExtension.swift
//  chitchat
//
//  Created by Liza Bipin on 22/08/21.
//

import Foundation
import UIKit

extension UIAlertController {
    func alert(with error: Error) -> UIAlertController {
        let alert = UIAlertController(title: "Something went wrong", message: error.localizedDescription, preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))

        return alert
    }
}
