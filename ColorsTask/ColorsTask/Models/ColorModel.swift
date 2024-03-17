//
//  ColorModel.swift
//  ColorsTask
//
//  Created by Samar Assi on 17/03/2024.
//

import Foundation
import SwiftUI

struct ColorModel: Identifiable, Hashable {
    var id = UUID()
    var colorName: String
    var color: Color
    var description: String
}
