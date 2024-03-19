//
//  ListEditViewModel.swift
//  ColorsTask
//
//  Created by Samar Assi on 19/03/2024.
//

import Foundation

final class ListEditViewModel: ObservableObject {
    @Published var colorViewModel: ColorViewModel
    
    init(colorViewModel: ColorViewModel) {
        self.colorViewModel = colorViewModel
    }
    
    func delete(indexSet: IndexSet) {
        colorViewModel.colors.remove(atOffsets: indexSet)
        colorViewModel.userDefaultManager.saveColors(colors: colorViewModel.colors)
    }
    
    func move(indices: IndexSet, newOffset: Int) {
        colorViewModel.colors.move(fromOffsets: indices, toOffset: newOffset)
        colorViewModel.userDefaultManager.saveColors(colors: colorViewModel.colors)
    }
}
