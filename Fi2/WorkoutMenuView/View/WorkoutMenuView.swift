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
                        
                        NavigationLink(destination: CustomWorkoutView(workoutTitles: $menu.workoutTitles)) {
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
                            VStack(spacing: geometry.size.height * 0.023) {
                                ForEach(menu.workoutTitles, id: \.self) { title in
                                    Text(title)
                                        .foregroundColor(.black)
                                }
                            }
                            .padding(.horizontal)
                            
                            Divider()
                                .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.004)
                                .overlay(Color.black)
                        }
                        
                    }
                }
            }
        }
        .navigationBarHidden(true)
    }
}

struct WorkoutMenuVIew_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutMenuView()
    }
}
