//
//  AddColorViewModel.swift
//  ColorsTask
//
//  Created by Samar Assi on 19/03/2024.
//

import Foundation

final class AddColorViewModel: ObservableObject {
    var colorItem: ColorModel
    var userDefaultsManager: UserDefaultsManager
    
    @Published var colorName: String = ""
    @Published var color: String = ""
    @Published var description: String = ""
    
    init() {
        self.colorItem = ColorModel(colorName: "", color: "", description: "")
        userDefaultsManager = UserDefaultsManager()
    }

    func add(colors: inout [ColorModel]) {
        colorItem = ColorModel(colorName: colorName, color: color, description: description)
        colors.append(colorItem)
        userDefaultsManager.saveColors(colors: colors)
    }
}
