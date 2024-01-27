//
//  LocalTimeline.swift
//  ios-app
//
//  Created by ANNOAMSTERDAM on 19/12/2023.
//

import Foundation

class LocalTimeline: Identifiable {
    let id = UUID()
    var year: Int
    var text: String

    init(year: Int, text: String) {
        self.year = year
        self.text = text
    }
}
