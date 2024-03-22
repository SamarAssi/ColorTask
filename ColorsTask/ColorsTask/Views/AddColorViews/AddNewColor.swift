//
//  AddNewColor.swift
//  ColorsTask
//
//  Created by Samar Assi on 17/03/2024.
//

import SwiftUI

struct AddNewColor: View {
    @StateObject var addColorViewModel: AddColorViewModel
    @Binding var showSheet: Bool
    @Binding var colors: [ColorModel]
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 15) {
                    TextFieldView(
                        placeholder: "Color Name",
                        height: 55,
                        text: $addColorViewModel.colorName
                    )
                    TextFieldView(
                        placeholder: "Color",
                        height: 55,
                        text: $addColorViewModel.color
                    )
                    TextFieldView(
                        placeholder: "Description",
                        height: 300,
                        text: $addColorViewModel.description
                    )
                    
                    Spacer()
                    addButtonView
                }
                .navigationTitle("Add new color")
                .padding(.horizontal, 40)
                .padding(.vertical, 20)
            }
        }
    }
}

extension AddNewColor {
    var addButtonView: some View {
        Button {
            addColorViewModel.add(colors: &colors)
            showSheet.toggle()
        } label: {
            Text("Add")
                .padding()
                .frame(maxWidth: .infinity)
                .fontWeight(.bold)
                .font(.title2)
                .background(Color.blue)
                .foregroundStyle(Color.white)
                .cornerRadius(10)
        }
    }
}

#Preview {
    AddNewColor(
        addColorViewModel: AddColorViewModel(),
        showSheet: .constant(false),
        colors: .constant([ColorModel(colorName: "", color: "", description: "")])
    )
}
