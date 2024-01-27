//
//  LocalImage.swift
//  ios-app
//
//  Created by ANNOAMSTERDAM on 19/12/2023.
//

import Foundation

class LocalImage: Identifiable{
    var url: String
    var source: String
    var year: Int

    init(url: String, source: String, year: Int) {
        self.url = url
        self.source = source
        self.year = year
    }
}
