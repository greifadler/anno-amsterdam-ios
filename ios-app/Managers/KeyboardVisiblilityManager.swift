//
//  KeyboardVisiblilityManager.swift
//  ios-app
//
//  Created by ANNOAMSTERDAM on 04/01/2024.
//

import Foundation
import Combine
import UIKit

class KeyboardVisibilityManager: ObservableObject {
    static let shared = KeyboardVisibilityManager()
    
    @Published var isVisible = false
    
    private init() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillHide),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc private func keyboardWillShow(notification: Notification) {
        isVisible = true
    }
    
    @objc private func keyboardWillHide(notification: Notification) {
        isVisible = false
    }
}
