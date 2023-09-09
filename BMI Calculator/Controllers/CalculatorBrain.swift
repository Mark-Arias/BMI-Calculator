//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Mark Arias on 8/25/23.
//  Copyright © 2023 Angela Yu. All rights reserved.
//

import UIKit

/**
 Contains all the code and logic to calculate a user's bmi,
 interpret said bmi, and figure out what color to set second vc's background view to
 based on control logic here.
 */
struct CalculatorBrain {
    
    
    private var calculatedBMI: BMI?
    
    mutating func calculateBMI(height: Float, weight: Float) {
        let bmiVal = weight / pow(height, 2)
        
        if bmiVal < 18.5 {
            calculatedBMI = BMI(value: bmiVal, advice: "Eat more pies", color: .blue )
            // print("Underweight")
        } else if bmiVal < 24.9 {
            // print("Normal")
            calculatedBMI = BMI(value: bmiVal, advice: "Fit as a fiddle", color: .green )
        } else  {
            // print("Overweight")
            calculatedBMI = BMI(value: bmiVal, advice: "Eat less pies", color: .red )
        }
    }
    
    func getBMIValue() -> String {
        return String(format: "%.1f", calculatedBMI?.value ?? "0.0")   // either return desired val if exists, or 0.0
    }
    
    func getAdvice() -> String {
        return calculatedBMI?.advice ?? "No advice yet"
    }
    
    func getColor() -> UIColor {
        return calculatedBMI?.color ?? .white
    }
    
    
    
}
