//
//  WorkoutMenuViewModel.swift
//  Fi2
//
//  Created by Joseph William Santoso on 22/03/23.
//

import SwiftUI

class WorkoutMenuViewModel: ObservableObject {
    @Published var sub = ["Workout Suggestions for below 18.5 BMI", "Workout Suggestions for below 24.9 BMI", "Workout Suggestions for above 30 BMI"]
}

