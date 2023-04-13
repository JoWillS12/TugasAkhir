//
//  WorkoutMenuVIew.swift
//  Fi2
//
//  Created by Joseph William Santoso on 06/03/23.
//

import SwiftUI

struct WorkoutMenuView: View {
    @ObservedObject var menu = WorkoutMenuViewModel()
    @ObservedObject var login = LoginViewModel()
    
    var body: some View {
        NavigationView {
            GeometryReader{ geometry in
                ZStack{
                    Rectangle()
                        .fill(Color.green)
                        .frame(width: geometry.size.width, height: geometry.size.height * 0.35)
                        .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.13)
                        .ignoresSafeArea()
                    VStack{
                        Spacer()
                            .frame(height: geometry.size.height * 0.07)
                        Text("Get Fit")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                        
                        NavigationLink(destination: CustomWorkoutView(workoutTitles: $menu.savedWorkouts)) {
                            Text("Add Custom Workout")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding(.all, 4.0)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 4)
                                        .stroke(Color.white, lineWidth: 2)
                                )
                        }
                        
                        Spacer()
                            .frame(height: geometry.size.height * 0.07)
                        
                        ScrollView {
                            VStack(spacing: geometry.size.height * 0.04) {
                                
                                ForEach(menu.savedWorkouts) { savedWorkout in
                                    NavigationLink(destination: WorkoutDetailView(detail: WorkoutDetailViewModel(savedWorkout: savedWorkout))) {
                                        Text(savedWorkout.title)
                                            .font(.title)
                                            .fontWeight(.bold)
                                            .foregroundColor(.white)
                                    }
                                    .frame(width: geometry.size.width * 0.96, height: geometry.size.height * 0.14)
                                    .background(
                                        Rectangle()
                                            .fill(Color.gray)
                                            .cornerRadius(25)
                                            .clipShape(RoundedRectangle(cornerRadius: 25))
                                    )
                                }
                                
                            }
                        }
                        
                    }
                }
            }
        }
        .navigationBarHidden(true)
        .onAppear {
            menu.userId = login.userId // Set userId to login.userId
            menu.fetchDataForUser(userId: menu.userId)
        }
        .onReceive(menu.$savedWorkouts) { _ in
            // Force view to refresh when menu.savedWorkouts changes
            // This may help in case the view is not updating properly
            // when saved workouts data changes
            self.menu.objectWillChange.send()
        }
    }
}

struct WorkoutMenuView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutMenuView()
    }
}

