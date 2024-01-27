//
//  ErrorView.swift
//  ios-app
//
//  Created by ANNOAMSTERDAM on 04/01/2024.
//

import SwiftUI


struct ErrorView: View {
    let error: Error

    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            Image(systemName: "exclamationmark.circle.fill")
                .font(Font.system(size: 50))
                .foregroundColor(.annoRed)
                .padding()
            
            Text("Error")
                .font(Font.custom("Oswald-Bold", size: 28))
            
            Text("\(error.localizedDescription)")
                .foregroundColor(.annoRed)
                .font(Font.custom("Oswald-Regular", size: 18))
                .padding(.horizontal)
                .multilineTextAlignment(.center)
            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .center)
        
       
    }
}

#Preview {
    ErrorView(error: ApiError.general)
}
