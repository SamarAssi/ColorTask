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
 
    @Published private (set) var description: String = ""
    @Published private (set) var background: String = ""
    
    @Published var selectedColor: ColorModel? {
        didSet {
            if let selectedColor = selectedColor {
                description = selectedColor.description
                background = selectedColor.color
            }
        }
    }
    @Published var colors: [ColorModel] = []
    
    func delete(indexSet: IndexSet) {
        colors.remove(atOffsets: indexSet)
        userDefaultManager.saveColors(colors: colors)
        updateColorValuesBasedOnChanges()
    }
    
    func move(indices: IndexSet, newOffset: Int) {
        colors.move(fromOffsets: indices, toOffset: newOffset)
        userDefaultManager.saveColors(colors: colors)
        updateColorValuesBasedOnChanges()
    }
    
    func setDefaultColorValues() {
        description = colors.first?.description ?? "The list is empty."
        background = colors.first?.color ?? "SkyBlue"
    }
    
    func updateColorValuesBasedOnChanges() {
        guard !colors.isEmpty else {
            setDefaultColorValues()
            description = "The list is empty."
            return
        }
        description = colors[0].description
        background = colors[0].color
    }
    
    func fetchData() {
        colors = userDefaultManager.loadColors()
        setDefaultColorValues()
    }
}
