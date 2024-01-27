//
//  Int+Extension.swift
//  ios-app
//
//  Created by ANNOAMSTERDAM on 04/01/2024.
//

import Foundation
extension Int {
    func formatAnnoYear() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .none
        return "Anno " + (formatter.string(from: NSNumber(value: self)) ?? "")
    }
}
