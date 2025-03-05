//
//  CalculatorModel.swift
//  Calculator
//
//  Created by Gaurav Semwal on 05/03/25.
//

import Foundation
import SwiftUI

enum Keys: String {
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case zero = "0"
    case add = "+"
    case subtract = "-"
    case multiply = "*"
    case divide = "/"
    case percent = "%"
    case clear = "AC"
    case equal = "="
    case decimal = "."
    case negative = "-/+"
    
    var buttonColor: Color {
        switch self {
        case .add, .multiply, .divide, .subtract, .equal:
            return Color("VOperator")
        case .clear, .negative, .percent:
            return Color("HOperator")
        default:
            return Color("Num")
        }
    }
}
