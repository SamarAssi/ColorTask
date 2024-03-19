//
//  ListView.swift
//  ColorsTask
//
//  Created by Samar Assi on 18/03/2024.
//

import SwiftUI

struct ListView: View {
    @StateObject var listEditModel: ListEditViewModel
    
    @Binding var description: String
    @Binding var background: Color
    @Binding var showSheet: Bool
        
    var body: some View {
        List {
            ForEach(listEditModel.colorViewModel.colors) { color in
                CellView(
                    colorName: color.colorName,
                    color: color.color,
                    description: color.description
                )
                .listRowBackground(Color(color.color))
                .onTapGesture {
                    description = color.description
                    background = Color(color.color)
                }
            }
            .onDelete(perform: listEditModel.delete)
            .onMove(perform: listEditModel.move)
        }
        .listStyle(.inset)
    }
}

#Preview {
    ListView(
        listEditModel: ListEditViewModel(colorViewModel: ColorViewModel()),
        description: .constant("This is a new color."),
        background: .constant(Color.blue),
        showSheet: .constant(false)
    )
}
