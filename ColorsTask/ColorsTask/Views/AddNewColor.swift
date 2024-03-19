//
//  AddNewColor.swift
//  ColorsTask
//
//  Created by Samar Assi on 17/03/2024.
//

import SwiftUI

struct AddNewColor: View {
    @StateObject var addColorModel: AddColorViewModel
    
    @State var colorName: String = ""
    @State var color: String = ""
    @State var description: String = ""
    
    @Binding var showSheet: Bool
        
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 15) {
                    TextFieldView(
                        placeholder: "Color Name",
                        amountOfHeight: 55,
                        textfield: $colorName
                    )
                    TextFieldView(
                        placeholder: "Color",
                        amountOfHeight: 55,
                        textfield: $color
                    )
                    TextFieldView(
                        placeholder: "Description",
                        amountOfHeight: 300,
                        textfield: $description
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
            addColorModel.add(
                colorName: colorName,
                color: color,
                description: description
            )
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
        addColorModel: AddColorViewModel(colorViewModel: ColorViewModel()),
        showSheet: .constant(false)
    )
}
