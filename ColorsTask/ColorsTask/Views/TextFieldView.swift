//
//  TextFieldView.swift
//  ColorsTask
//
//  Created by Samar Assi on 18/03/2024.
//

import SwiftUI

struct TextFieldView: View {
    @State var placeholder: String
    @State var amountOfHeight: CGFloat
    
    @Binding var textfield: String
    
    var body: some View {
        TextField(placeholder, text: $textfield, axis: .vertical)
            .padding()
            .frame(height: amountOfHeight, alignment: .topLeading)
            .background(Color(UIColor.secondarySystemBackground))
            .cornerRadius(10)
    }
}

#Preview {
    TextFieldView(placeholder: "Enter your info", amountOfHeight: 55, textfield: .constant(""))
}
