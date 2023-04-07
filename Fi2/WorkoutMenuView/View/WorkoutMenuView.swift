//
//  WorkoutMenuVIew.swift
//  Fi2
//
//  Created by Joseph William Santoso on 06/03/23.
//

import SwiftUI

struct WorkoutMenuView: View {
    @ObservedObject var menu = WorkoutMenuViewModel()
    
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
                                    Button(action: {
                                        // Add action you want to perform on button tap
                                    }) {
                                        Text(savedWorkout.title)
                                            .foregroundColor(.black)
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
//                            .padding(.horizontal)
//                            .background(Color.red)
                            
                            
                            
                            
                            
                            
                            //                            Divider()
                            //                                .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.004)
                            //                                .overlay(Color.black)
                        }
                        
                    }
                }
            }
        }
        .navigationBarHidden(true)
        .onAppear {
            menu.fetchData()
        }
    }
}

struct WorkoutMenuVIew_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutMenuView()
    }
}
