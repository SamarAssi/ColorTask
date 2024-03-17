//
//  ColorViewModel.swift
//  ColorsTask
//
//  Created by Samar Assi on 17/03/2024.
//

import Foundation
import SwiftUI


final class ColorViewModel: ObservableObject {
    @Published var colorViewModel: [ColorModel] = [
        ColorModel(
            colorName: Constant.ColorName.DEEP_TEAL,
            color: Color(Constant.Color.DEEP_TEAL),
            description: Constant.Description.DEEP_TEAL
        ),
        ColorModel(
            colorName: Constant.ColorName.CATALINA_BLUE,
            color: Color(Constant.Color.CATALINA_BLUE),
            description: Constant.Description.CATALINA_BLUE
        ),
        ColorModel(
            colorName: Constant.ColorName.DARK_INDIGO,
            color: Color(Constant.Color.DARK_INDIGO),
            description: Constant.Description.DARK_INDIGO
        ),
        ColorModel(
            colorName: Constant.ColorName.RIPE_PLUM,
            color: Color(Constant.Color.RIPE_PLUM),
            description: Constant.Description.RIPE_PLUM
        ),
        ColorModel(
            colorName: Constant.ColorName.MULBERRY_WOOD,
            color: Color(Constant.Color.MULBERRY_WOOD),
            description: Constant.Description.MULBERRY_WOOD
        ),
        ColorModel(
            colorName: Constant.ColorName.KENYAN_COPPER,
            color: Color(Constant.Color.KENYAN_COPPER),
            description: Constant.Description.KENYAN_COPPER
        ),
        ColorModel(
            colorName: Constant.ColorName.CHESTNUT,
            color: Color(Constant.Color.CHESTNUT),
            description: Constant.Description.CHESTNUT
        ),
        ColorModel(
            colorName: Constant.ColorName.ANTIQUE_BRONZE,
            color: Color(Constant.Color.ANTIQUE_BRONZE),
            description: Constant.Description.ANTIQUE_BRONZE
        )
    ]
    
    
    func delete(indexSet: IndexSet) {
        colorViewModel.remove(atOffsets: indexSet)
    }
    
    func move(indices: IndexSet, newOffset: Int) {
        colorViewModel.move(fromOffsets: indices, toOffset: newOffset)
    }
    
    func add(colorName: String, color: String, description: String) {
        let colorModel = ColorModel(colorName: colorName, color: Color(color), description: description)
        colorViewModel.append(colorModel)
    }
}
