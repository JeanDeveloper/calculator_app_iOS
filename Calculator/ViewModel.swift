//
//  ViewModel.swift
//  Calculator
//
//  Created by Jean Carlo Chunga Sandoval on 16/02/25.
//

import Foundation

final class ViewModel : ObservableObject{
    
    @Published var textFieldValue : String = "0"
    var textFieldSavedValue: String = "0"
    var currentOperationToExecute: OperationType?
    var shouldRunOperation: Bool = false
    
    func logic(key: KeyboardButton){
        switch key.type {
            
            case .number(let value):
                if shouldRunOperation{
                    textFieldValue = "0"
                }
                textFieldValue = textFieldValue == "0" ? String(value) : textFieldValue + String(value)
                
            case .clear:
                textFieldValue = "0"
                textFieldSavedValue = "0"
                currentOperationToExecute = nil
                shouldRunOperation = false
            
            case .equal:
                guard let operation = currentOperationToExecute else {
                    return
                }
                
                switch operation {
                    case .multiplication:
                        let result = multiply(a: Double(textFieldSavedValue)!, b: Double(textFieldValue) ?? 0.00)
                        textFieldValue = result.truncatingRemainder(dividingBy: 1) == 0 ? String(Int(result)) : String(result)
                    
                    case .division:
                        let result = divide(a: Double(textFieldSavedValue)!, b: Double(textFieldValue) ?? 0.00)
                        textFieldValue = result.truncatingRemainder(dividingBy: 1) == 0 ? String(Int(result)) : String(result)
                    
                    case .sum:
                        let result = sum(a: Double(textFieldSavedValue) ?? 0.00, b: Double(textFieldValue) ?? 0.00)
                        textFieldValue = result.truncatingRemainder(dividingBy: 1) == 0 ? String(Int(result)) : String(result)
                        
                    case .rest:
                        let result = rest(a: Double(textFieldSavedValue) ?? 0.00, b: Double(textFieldValue) ?? 0.00)
                        textFieldValue = result.truncatingRemainder(dividingBy: 1) == 0 ? String(Int(result)) : String(result)
                }
            
            
            case .operation(let type):
                textFieldSavedValue = textFieldValue
                currentOperationToExecute = type
                shouldRunOperation = true
        }
    }
    
    func sum(a: Double, b: Double) -> Double{ return a + b }
    
    func rest(a: Double, b: Double) -> Double{ return a - b }
    
    func multiply(a: Double, b: Double) -> Double{ return a * b }
    
    func divide(a: Double, b: Double) -> Double{ return a / b }
    
}
