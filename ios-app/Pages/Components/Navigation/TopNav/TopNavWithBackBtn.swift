//
//  TopNavWithBackBtn.swift
//  ios-app
//
//  Created by ANNOAMSTERDAM on 20/12/2023.
//

import SwiftUI

struct TopNavWithBackBtn: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {
        HStack {
            AnnoButtonOutlined(action: { presentationMode.wrappedValue.dismiss() }) {
                Image(systemName: "chevron.left")
                Text("BACK")
                  .font(
                    Font.custom("NotoSerif", size: 16)
                      .weight(.medium)
                  )
                  .foregroundColor(.annoBlue)
            }
        }
    }
}
