//
//  BMIViewModel.swift
//  Fi2
//
//  Created by Joseph William Santoso on 13/03/23.
//

import SwiftUI

class BMIViewModel: ObservableObject {

    @Published var height: Double = 0.0
    @Published var weight: Double = 0.0
    @Published var result: Double = 0.0
    @Published var category = ""

    
    func bmi(){
        result = weight / (height/100 * height/100)
        if result > 0.0 && result < 18.5{
            category = "Underweight"
        }
        if result >= 18.5 && result <= 24.9 {
            category = "Normal"
        }
        if result >= 25.0 && result <= 29.9 {
            category = "Overweight"
        }
        if result >= 30 {
            category = "Obese"
        }
    }
}


