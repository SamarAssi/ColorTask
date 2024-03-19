//
//  UserDefaultsManager.swift
//  ColorsTask
//
//  Created by Samar Assi on 19/03/2024.
//

import Foundation

final class UserDefaultsManager {
    enum Keys: String {
        case colorList = "color_list"
    }
    
    func saveColors(colors: [ColorModel]) {
        do {
            let data = try JSONEncoder().encode(colors)
            UserDefaults.standard.set(data, forKey: Keys.colorList.rawValue)
        } catch {
            print("Error encoding colorViewModel: \(error)")
        }
    }
    
    func loadColors() -> [ColorModel] {
        guard let data = UserDefaults.standard.data(forKey: Keys.colorList.rawValue) else {
            return []
        }
        do {
            let colors = try JSONDecoder().decode([ColorModel].self, from: data)
            return colors
        } catch {
            print("Error decoding colorViewModel: \(error)")
            return []
        }
    }
}
