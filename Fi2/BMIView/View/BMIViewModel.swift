//
//  BMIViewModel.swift
//  Fi2
//
//  Created by Joseph William Santoso on 13/03/23.
//

import SwiftUI

class BMIViewModel: ObservableObject {
    @Published var gender = ""
    @Published var genders = ["Male", "Female"]
    @Published var age: Int = 0
    @Published var height: Double = 0.0
    @Published var weight: Double = 0.0
    @Published var result: Double = 0.0
    @Published var category = ""
    
    func bmi(){
        result = weight / (height/100 * height/100)
        if result < 18.5 {
            category = "Too skinny"
        }
        if result <= 24.9 {
            category = "Normal"
        }
        if result <= 29.9 {
            category = "Too much"
        }
        if result >= 30 {
            category = "Obese"
        }
    }
}


