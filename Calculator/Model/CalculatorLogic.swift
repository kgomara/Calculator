//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Kevin O'Mara on 4/12/19.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLocic {
    
    private var number: Double?
    
    private var intermediateCalculation: (n1: Double, operation: String)?
        
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    mutating func calculate(symbol: String) -> Double? {
        
        if let n = number {
            switch symbol {
            case "AC":
                return 0
            case "+/-":
                return n * -1
            case "%":
                return n * 0.01
            case "=":
                return performTwoNumberCalculation(n2: n)
            default:
                intermediateCalculation = (n1: n, operation: symbol)
            }
        }
        return nil
    }
    
    private func performTwoNumberCalculation(n2: Double) -> Double? {
        
        if let n1 = intermediateCalculation?.n1, let op = intermediateCalculation?.operation {
            switch op {
            case "+":
            return n1 + n2
            case "×":
                return n1 * n2
            case "-":
                return n1 - n2
            case "÷":
                return n1 / n2
            default:
                fatalError("The operation passed in does not match any of the cases")
            }
        }
        return nil
    }
}
