//
//  AddColorViewModel.swift
//  ColorsTask
//
//  Created by Samar Assi on 19/03/2024.
//

import Foundation

final class AddColorViewModel: ObservableObject {
    @Published var colorViewModel: ColorViewModel
    var colorItem: ColorModel
    
    init(colorViewModel: ColorViewModel) {
        self.colorItem = ColorModel(colorName: "", color: "", description: "")
        self.colorViewModel = colorViewModel
    }
    
    func add(colorName: String, color: String, description: String) {
        colorItem = ColorModel(colorName: colorName, color: color, description: description)
        colorViewModel.colors.append(colorItem)
        colorViewModel.userDefaultManager.saveColors(colors: colorViewModel.colors)
    }
}
