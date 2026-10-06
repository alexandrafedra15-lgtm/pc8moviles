//
//  CalculationModel.swift
//  apple_lab08_pract02_UIKit
//

import Foundation

enum MathOperation: String, CaseIterable {
    case addition = "Addition (+)"
    case subtraction = "Subtraction (-)"
    case multiplication = "Multiplication (×)"
    
    var symbol: String {
        switch self {
        case .addition: return "+"
        case .subtraction: return "-"
        case .multiplication: return "×"
        }
    }
    
    func calculate(first: Double, second: Double) -> Double {
        switch self {
        case .addition:
            return first + second
        case .subtraction:
            return first - second
        case .multiplication:
            return first * second
        }
    }
}

class CalculationModel: NSObject {
    static let shared = CalculationModel()
    
    var operation: MathOperation = .addition
    var firstNumber: Double = 42
    var secondNumber: Double = 28
    
    override init() {
        super.init()
    }
    
    init(operation: MathOperation, firstNumber: Double, secondNumber: Double) {
        self.operation = operation
        self.firstNumber = firstNumber
        self.secondNumber = secondNumber
        super.init()
    }
    
    var result: Double {
        return operation.calculate(first: firstNumber, second: secondNumber)
    }
    
    var formattedFirstNumber: String {
        return Self.formatNumber(firstNumber)
    }
    
    var formattedSecondNumber: String {
        return Self.formatNumber(secondNumber)
    }
    
    var formattedResult: String {
        return Self.formatNumber(result)
    }
    
    static func formatNumber(_ num: Double) -> String {
        if num.truncatingRemainder(dividingBy: 1) == 0 {
            return String(format: "%.0f", num)
        } else {
            return String(format: "%g", num)
        }
    }
}
