//
//  ListView.swift
//  ColorsTask
//
//  Created by Samar Assi on 18/03/2024.
//

import SwiftUI

struct ListView: View {
    @ObservedObject var colorViewModel: ColorViewModel
    @Binding var showSheet: Bool
        
    var body: some View {
        List {
            ForEach(colorViewModel.colors) { color in
                ListCellView(colorName: color.colorName)
                    .listRowBackground(Color(color.color))
                    .onTapGesture {
                        colorViewModel.description = color.description
                        colorViewModel.background = Color(color.color)
                    }
            }
            .onDelete(perform: colorViewModel.delete)
            .onMove(perform: colorViewModel.move)
        }
        .listStyle(.inset)
    }
}

#Preview {
    ListView(
        colorViewModel: ColorViewModel(),
        showSheet: .constant(false)
    )
}
