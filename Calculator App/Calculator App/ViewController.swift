//
//  ViewController.swift
//  Calculator App
//
//  Created by Muhammad Waleed on 03.01.2024.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IBOutlets

    // Stored all buttons references in UIButton array
    @IBOutlet var calculatorBttns: [UIButton]!
    @IBOutlet weak var displayLabel: UILabel!

    // MARK: - Properties
    
    var firstOperand: Double?
    var currentOperator: String?
    var isTypingNumber = false

    override func viewDidLoad() {
        super.viewDidLoad()
        roundCorners()
    }

    // Sets up rounded corners for all buttons.
    private func roundCorners() {
        for bttns in calculatorBttns {
            bttns.layer.cornerRadius = 12
        }
    }

    // MARK: - Button Actions

    // Handles the press of number buttons.
    @IBAction func numberButtonPressed(_ sender: UIButton) {
        guard let number = sender.titleLabel?.text else { return }

        if isTypingNumber {
            displayLabel.text? += number
        } else {
            displayLabel.text = number
            isTypingNumber = true
        }
    }

    // Handles the press of operator buttons.
    @IBAction func operatorButtonPressed(_ sender: UIButton) {
        if isTypingNumber {
            if let number = Double(displayLabel.text ?? "") {
                firstOperand = number
            }
            isTypingNumber = false
        }

        currentOperator = sender.titleLabel?.text
    }

    // Handles the press of the equals button.
    @IBAction func equalsButtonPressed(_ sender: UIButton) {
        guard let operatorSymbol = currentOperator,
              let secondOperand = Double(displayLabel.text ?? ""),
              let firstOperand = firstOperand else {
            return
        }

        var result: Double?

        // Performs the calculation based on the selected operator.
        switch operatorSymbol {
        case "+":
            result = firstOperand + secondOperand
        case "-":
            result = firstOperand - secondOperand
        case "×":
            result = firstOperand * secondOperand
        case "÷":
            result = secondOperand != 0 ? firstOperand / secondOperand : nil
        case "%":
            result = firstOperand / 100
        case "±":
            result = -secondOperand
        default:
            break
        }

        // Displays the result on the label with clean formatting.
        if let resultValue = result {
            displayLabel.text = String(resultValue).convertFromDoubleToCleanString()
        }
        
        isTypingNumber = false
    }

    // Handles the press of the clear button.
    @IBAction func clearButtonPressed(_ sender: UIButton) {
        displayLabel.text = "0"
        firstOperand = nil
        currentOperator = nil
        isTypingNumber = false
    }

    // Handles the press of the decimal point button.
    @IBAction func decimalButtonPressed(_ sender: UIButton) {
        if let currentText = displayLabel.text, !currentText.contains(".") {
            displayLabel.text? += "."
            isTypingNumber = true
        }
    }
    
    @IBAction func removeLastDigit(_ sender: Any) {
        guard var currentText = displayLabel.text, currentText.count > 0 else {
            return
        }
        
        // Remove the last character
        currentText.removeLast()
        
        // Update the display label
        displayLabel.text = currentText.isEmpty ? "0" : currentText
    }
}
