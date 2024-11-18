//
//  Configration.swift
//  PushNotification
//
//  Created by Priya Hansaliya on 12/08/24.
//

import Foundation
import UIKit

let storyboard = UIStoryboard(name: "Main", bundle: nil)
var appDelegate : AppDelegate? { return UIApplication.shared.delegate as? AppDelegate }

extension String {
    var isValidEmail: Bool {
        let kEmailRegex = "(?:[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+)*)@(?:(?:[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?\\.)+[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?)"

        let emailRegEx = kEmailRegex
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
}
