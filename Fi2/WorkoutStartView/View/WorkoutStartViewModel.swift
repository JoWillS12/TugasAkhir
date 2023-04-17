//
//  WorkoutStartViewModel.swift
//  Fi2
//
//  Created by Joseph William Santoso on 10/04/23.
//

import Foundation

class WorkoutStartViewModel: ObservableObject {
    @Published var currentIndex = 0
    @Published var isPaused = false
    let savedWorkout: SavedWorkout
    let workouts: [CustomWorkout] // add this property
    var timer: Timer?
    @Published var remainingTime = 30
    @Published var showWorkoutDetail = false
    let pointsToAdd = 10
    @Published var score = 0
   
    
    init(savedWorkout: SavedWorkout) {
        self.savedWorkout = savedWorkout
        self.workouts = savedWorkout.workouts // assign value to the new property
        startTimer()
    }
   
        
   
    func startTimer() {
        self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if !self.isPaused {
                self.remainingTime -= 1
                if self.remainingTime <= 0 {
                    self.currentIndex = (self.currentIndex + 1) % self.workouts.count
                    self.remainingTime = 30 // reset the timer
                    if self.currentIndex == 0 {
                        // all workouts have been shown, go back to WorkoutDetailView
                        self.showWorkoutDetail = true
                        self.timer?.invalidate()
                        self.timer = nil
                        
                        ProfileViewModel().score()
                    }
                }
            }
        }
    }
    
    
    func togglePause() {
        self.isPaused.toggle()
    }
    
    
}
