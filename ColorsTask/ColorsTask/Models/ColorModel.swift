//
//  ColorModel.swift
//  ColorsTask
//
//  Created by Samar Assi on 17/03/2024.
//

import Foundation
import SwiftUI

struct ColorModel: Identifiable, Hashable, Codable {
    var id = UUID()
    var colorName: String
    var color: String
    var description: String
}
