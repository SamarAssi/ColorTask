//
//  CellView.swift
//  ColorsTask
//
//  Created by Samar Assi on 19/03/2024.
//

import SwiftUI

struct CellView: View {
    @State var colorName: String
    @State var color: String
    @State var description: String
    
    var body: some View {
        ZStack(alignment: .leading) {
            Color(color).ignoresSafeArea()
            
            Text(colorName)
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
                .padding(.vertical, 8)
        }
    }
}

#Preview {
    CellView(
        colorName: "Sky Blue",
        color: "SkyBlue",
        description: "This is a new color"
    )
}
