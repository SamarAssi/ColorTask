//
//  ColorViewModel.swift
//  ColorsTask
//
//  Created by Samar Assi on 17/03/2024.
//

import Foundation
import SwiftUI

final class ColorViewModel: ObservableObject {
    private var userDefaultManager = UserDefaultsManager()
 
    @Published var description: String = ""
    @Published var background: Color = .white
    
    @Published var colors = [
        ColorModel(
            colorName: Constant.ColorName.DEEP_TEAL,
            color: Constant.Color.DEEP_TEAL,
            description: Constant.Description.DEEP_TEAL
        ),
        ColorModel(
            colorName: Constant.ColorName.CATALINA_BLUE,
            color: Constant.Color.CATALINA_BLUE,
            description: Constant.Description.CATALINA_BLUE
        ),
        ColorModel(
            colorName: Constant.ColorName.DARK_INDIGO,
            color: Constant.Color.DARK_INDIGO,
            description: Constant.Description.DARK_INDIGO
        ),
        ColorModel(
            colorName: Constant.ColorName.RIPE_PLUM,
            color: Constant.Color.RIPE_PLUM,
            description: Constant.Description.RIPE_PLUM
        ),
        ColorModel(
            colorName: Constant.ColorName.MULBERRY_WOOD,
            color: Constant.Color.MULBERRY_WOOD,
            description: Constant.Description.MULBERRY_WOOD
        ),
        ColorModel(
            colorName: Constant.ColorName.KENYAN_COPPER,
            color: Constant.Color.KENYAN_COPPER,
            description: Constant.Description.KENYAN_COPPER
        ),
        ColorModel(
            colorName: Constant.ColorName.CHESTNUT,
            color: Constant.Color.CHESTNUT,
            description: Constant.Description.CHESTNUT
        ),
        ColorModel(
            colorName: Constant.ColorName.ANTIQUE_BRONZE,
            color: Constant.Color.ANTIQUE_BRONZE,
            description: Constant.Description.ANTIQUE_BRONZE
        )
    ]
    
    func delete(indexSet: IndexSet) {
        colors.remove(atOffsets: indexSet)
        userDefaultManager.saveColors(colors: colors)
    }
    
    func move(indices: IndexSet, newOffset: Int) {
        colors.move(fromOffsets: indices, toOffset: newOffset)
        userDefaultManager.saveColors(colors: colors)
    }
    
    func setDefaultColorValues() {
        description = colors[0].description
        background = Color(colors[0].color)
    }
    
    func updateColorValuesBasedOnChanges() {
        guard !colors.isEmpty else {
            description = "The list is empty"
            return
        }
        description = colors[0].description
        background = Color(colors[0].color)
    }
}
