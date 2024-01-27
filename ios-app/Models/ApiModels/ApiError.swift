//
//  ApiError.swift
//  ios-app
//
//  Created by ANNOAMSTERDAM on 03/01/2024.
//

import Foundation
//
//  AnnoError.swift
//  ios-app
//
//  Created by hohe on 27.11.23.
//

import Foundation

enum ApiError: LocalizedError {
    
    case general
    case noInternet
    
    var errorDescription: String? {
        switch self {
        case .general:
            return "Something went wrong"
        case .noInternet:
            return "you appered to be offline"
        }
    }
}
