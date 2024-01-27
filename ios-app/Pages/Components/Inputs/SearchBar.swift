//
//  SearchBar.swift
//  ios-app
//
//  Created by ANNOAMSTERDAM on 04/01/2024.
//

import Foundation
import SwiftUI

struct SearchBar: View {
    @EnvironmentObject
       var annoStore: AnnoStore
    
    @State private var text = ""

    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.annoBlue)
                .padding(.leading)
            
            TextField(
                "Search by address",
                text: $text,
                onCommit: {
                    annoStore.searchTerm = text
                }
            )
                .font(
                Font.custom("Noto Serif", size: 16)
                .weight(.medium)
                )
                .foregroundColor(.annoBlue)
            
            if !text.isEmpty {
                Button(action: {
                    text = ""
                    annoStore.searchTerm = ""
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.annoRed)
                }
                .padding(.trailing)
            }
        }
        .frame(maxWidth: .infinity, minHeight: 40, alignment: .leading)
        .background(Color.white)
        .cornerRadius(5)
        .overlay(
            RoundedRectangle(cornerRadius: 5)
                .inset(by: 0.5)
                .stroke(.annoLight)
        )
        .onAppear {
            text = annoStore.searchTerm
        }
    }
}

#Preview {
    SearchBar()
        .environmentObject(AnnoStore())
        .padding()
}
