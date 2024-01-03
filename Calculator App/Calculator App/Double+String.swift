//
//  Double+String.swift
//  Calculator App
//
//  Created by Muhammad Waleed on 03.01.2024.
//

import Foundation

extension Double {
    // Returns a clean string representation of the double, without trailing zeros.
    var clean: String {
        return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
    
    // Truncates the double to the specified number of decimal places.
    func truncate(places: Int) -> Double {
        return Double(floor(pow(10.0, Double(places)) * self) / pow(10.0, Double(places)))
    }
}

extension String {
    // Converts a string to a clean string representation of a double, truncating trailing zeros.
    func convertFromDoubleToCleanString() -> String? {
        // If the last character is a dot, return the string as is.
        if self.last == "." {
            return self
        }
        
        // Attempt to convert the string to a double.
        if let double = Double(self) {
            // Truncate to 4 decimal places and return the clean string representation.
            return double.truncate(places: 4).clean
        } else {
            // Return nil if conversion fails.
            return nil
        }
    }
}
