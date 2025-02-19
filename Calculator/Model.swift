//
//  Model.swift
//  Calculator
//
//  Created by Jean Carlo Chunga Sandoval on 15/02/25.
//

import Foundation
import SwiftUI


struct KeyboardButton: Hashable{
    let title: String
    let textColor: Color
    let backgroundColor: Color
    let isDoubleWidth: Bool
    let type: ButtonType
}

enum ButtonType: Hashable{
    case number(Int)
    case operation(OperationType)
    case clear
    case equal
//    case decimal
}

enum OperationType: Hashable{
    case sum
    case rest
    case multiplication
    case division
}
