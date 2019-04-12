//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2018.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTypeingNumbers: Bool = true
    
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Cannot convert display label text to Double")
            }
            return number
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    private var calculator = CalculatorLocic()

    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        isFinishedTypeingNumbers = true
        calculator.setNumber(displayValue)
        
        if let calcMethod = sender.currentTitle {
            if let result = calculator.calculate(symbol: calcMethod) {
                displayValue = result
            }
        }
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        if let numValue = sender.currentTitle {
            if isFinishedTypeingNumbers {
                displayLabel.text =  numValue
                isFinishedTypeingNumbers = false
            }
            else {
                let isInt = floor(displayValue) == displayValue
                if !isInt {
                    return
                }
                displayLabel.text = displayLabel.text! + numValue
            }
        }
    }

}

