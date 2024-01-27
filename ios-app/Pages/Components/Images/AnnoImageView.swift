//
//  AnnoImage.swift
//  ios-app
//
//  Created by ANNOAMSTERDAM on 14/12/2023.
//

import Foundation
import SwiftUI

struct AnnoImageView: View {
    let imageLink: String
    let maxWidth: CGFloat
    let maxHeigth: CGFloat
    let contentDescription: String
    let cornerRadius: CGFloat
    
    var body: some View {
        GeometryReader { geometry in
            AsyncImage(url: URL(string: imageLink)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .frame(width: maxWidth, height: maxHeigth)
                    
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: min(geometry.size.width,  maxWidth), height: maxHeigth)
                        .cornerRadius(cornerRadius)
                        .clipped()
                    
                    //  .transition(.fade(duration: 0.5
                        .animation(.easeInOut)
                        .accessibility(label: Text(contentDescription))
                case .failure:
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: maxWidth, height: maxHeigth)
                        .cornerRadius(cornerRadius)
                        .clipped()
                    //    .transition(.fade(duration: 0.5))
                        .animation(.easeInOut)
                        .accessibility(label: Text(contentDescription))
                @unknown default:
                    EmptyView()
                        .frame(width: maxWidth, height: maxHeigth)
                    
                    
                }
            }
        }
    }
}
