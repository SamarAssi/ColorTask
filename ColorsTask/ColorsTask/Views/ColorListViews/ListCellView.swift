//
//  ListCellView.swift
//  ColorsTask
//
//  Created by Samar Assi on 19/03/2024.
//

import SwiftUI

struct ListCellView: View {
    var colorName: String
    
    var body: some View {
        Text(colorName)
            .fontWeight(.bold)
            .foregroundStyle(Color.white)
            .padding(.vertical, 10)
    }
}

#Preview {
    ListCellView(colorName: "Sky Blue")
}
