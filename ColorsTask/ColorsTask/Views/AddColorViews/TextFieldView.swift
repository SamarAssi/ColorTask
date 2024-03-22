//
//  TextFieldView.swift
//  ColorsTask
//
//  Created by Samar Assi on 18/03/2024.
//

import SwiftUI

struct TextFieldView: View {
    var placeholder: String
    var height: CGFloat
    
    @Binding var text: String
    
    var body: some View {
        TextField(placeholder, text: $text, axis: .vertical)
            .padding()
            .frame(height: height, alignment: .topLeading)
            .background(Color(UIColor.secondarySystemBackground))
            .cornerRadius(10)
    }
}

#Preview {
    TextFieldView(
        placeholder: "Enter your info",
        height: 55,
        text: .constant("")
    )
}
