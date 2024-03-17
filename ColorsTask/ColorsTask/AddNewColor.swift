//
//  AddNewColor.swift
//  ColorsTask
//
//  Created by Samar Assi on 17/03/2024.
//

import SwiftUI

struct AddNewColor: View {
    @EnvironmentObject var colorViewModel: ColorViewModel
    @State var colorName: String = ""
    @State var color: String = ""
    @State var description: String = ""
    @Binding var showSheet: Bool
    
    @AppStorage("name") var currentColorName: String?
    @AppStorage("color") var currentColor: String?
    @AppStorage("description") var currentDescription: String?
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 15) {
                TextField("Color Name", text: $colorName)
                    .padding()
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                    .autocapitalization(.none)
                TextField("Color", text: $color)
                    .padding()
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                TextField("Description", text: $description)
                    .padding()
                    .frame(height: 300, alignment: .topLeading)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                
                Spacer()
                Button {
                    colorViewModel.add(colorName: colorName, color: color, description: description)
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
            .navigationTitle("Add new color")
            .padding(.horizontal, 40)
            .padding(.vertical, 20)
        }
    }
    
    func saveColorInfo() {
        currentColorName = colorName
        currentColor = color
        currentDescription = description
    }
}

#Preview {
    AddNewColor(showSheet: .constant(false))
        .environmentObject(ColorViewModel())
}
