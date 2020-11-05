//
//  ViewController.swift
//  CalculatorApp
//
//  Created by ibg training 5 on 11/4/20.
//  Copyright © 2020 ibg training 5. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTyping: Bool = true
    
    private var displayValue: Double {
        
        get {
            
            guard let number = Double(displayLabel.text!) else {
                fatalError("Cannot convert display text into a string")
            }
            return number
        }
        
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    private var calculator = CalculatorLogic()
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        
        isFinishedTyping = true
        
        calculator.setNumber(displayValue)
        
        if let calcMethod = sender.currentTitle {
            
            if let result = calculator.calculate(symbol: calcMethod) {
                
                displayValue = result
            }
        }
        
    }
    
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
        
        if let numValue = sender.currentTitle {
            
            if isFinishedTyping {
                displayLabel.text = numValue
                isFinishedTyping = false
            } else {
                
                if numValue == "." {
                    
                    let isInt = floor(displayValue) == displayValue
                    
                    if !isInt {
                        return
                    }
                    
                }
                
                displayLabel.text = displayLabel.text! + numValue
                
            }
        }
    }
}
