//
//  ListView.swift
//  ColorsTask
//
//  Created by Samar Assi on 18/03/2024.
//

import SwiftUI

struct ListView: View {
    @ObservedObject var colorViewModel: ColorViewModel
    
    @Binding var description: String
    @Binding var background: Color
    @Binding var showSheet: Bool
    
    @State var amountOfPadding: CGFloat
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(colorViewModel.colorViewModel, id: \.self) { color in
                    Text(color.colorName)
                        .fontWeight(.bold)
                        .foregroundStyle(Color.white)
                        .padding(.vertical, 8)
                        .padding(.leading, amountOfPadding)
                        .listRowBackground(Color(color.color))
                        .onTapGesture {
                            description = color.description
                            background = Color(color.color)
                        }

                }
                .onDelete(perform: colorViewModel.delete)
                .onMove(perform: colorViewModel.move)
            }
            .listStyle(.inset)
        }
    }
}

#Preview {
    ListView(
        colorViewModel: ColorViewModel(),
        description: .constant("This is a new color."),
        background: .constant(Color.blue),
        showSheet: .constant(false),
        amountOfPadding: 0
    )
}
